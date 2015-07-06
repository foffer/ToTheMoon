//
//  ViewController.swift
//  To The Moon
//
//  Created by Christoffer Buusmann on 03/07/2015.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import UIKit
import RealmSwift

class NewIdeaViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, QuestionInterface {

    var scoreArr:Array<Question>?
    var nextIndexPath: NSIndexPath?
    var ideaName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("questionCell", forIndexPath: indexPath) as! QuestionCollectionViewCell
        
        let question = Data[indexPath.item]

        cell.configureCell(question)
        cell.delegate = self

        if indexPath.item <= 7 {
            let newIndex = indexPath.indexAtPosition(indexPath.length - 1) + 1
            nextIndexPath = indexPath.indexPathByRemovingLastIndex().indexPathByAddingIndex(newIndex)
            cell.nextButton.addTarget(self, action: "changeCell:", forControlEvents: .TouchUpInside)
        } else {
            cell.nextButton.setTitle("Done", forState: .Normal)
            cell.nextButton.addTarget(self, action: "doneDidPress:", forControlEvents: .TouchUpInside)
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView!.bounds.width,self.collectionView!.bounds.height)
    }
    func nextDidPress(sender: AnyObject) {
        guard let q = sender as? Question else {return}
        
        if scoreArr == nil {
            scoreArr = [q]
        } else {
            scoreArr?.append(q)
        }
    }
    
    func changeCell(sender: AnyObject) {
        collectionView?.scrollToItemAtIndexPath(nextIndexPath!, atScrollPosition: .CenteredHorizontally, animated: false)
    }
    func doneDidPress(sender: AnyObject) {
        
        let alertVC = UIAlertController(title: "Name", message: "Please type in a name for your idea", preferredStyle: .Alert)
        let nameAction = UIAlertAction(title: "Add", style: .Default) { _ in
            let nameTextField = alertVC.textFields![0] as UITextField
            self.ideaName = nameTextField.text! ?? ""
            self.createIdea()
        }
        alertVC.addTextFieldWithConfigurationHandler { textField in
            textField.placeholder = "Name"
        }
        
        alertVC.addAction(nameAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    func createIdea() {
        let idea = Idea()
        idea.createdAt = NSDate()
        idea.name = ideaName
        idea.uuid = NSUUID().UUIDString
        
        var average = 0
        for q in scoreArr! {
            idea.questions.append(q)
            average += q.score
        }
        idea.overallScore = average / scoreArr!.count
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let realm = try! Realm()
            realm.write {
                realm.add(idea)
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.dismissDidPress(nil)
            }
        }
    }
    func dismissDidPress(sender: AnyObject?) {
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Fade)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

