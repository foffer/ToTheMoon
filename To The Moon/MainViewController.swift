//
//  ViewController.swift
//  To The Moon
//
//  Created by Christoffer Buusmann on 03/07/2015.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, QuestionInterface {

    var scoreArr:Array<Question>?
    var nextIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
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
        print(indexPath.item)
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

//        let idea = Idea()
//        idea.createdAt = NSDate()
//        
//        for q in scoreArr! {
//            idea.questions.append(q)
//        }
//        do {
//
//        } catch {
//            print(error)
//        }
    }
}

