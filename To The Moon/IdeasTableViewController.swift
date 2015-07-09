//
//  IdeasTableViewController.swift
//  To The Moon
//
//  Created by Jes Buusmann on 06/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class IdeasTableViewController: UITableViewController {
    var ideaArr: Results<Idea>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.translucent = false
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
//        navigationController?.navigationBar.barTintColor = BlueColor
//        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar
        tableView.backgroundColor = BlackColor
        fetchData()
    }
    
    func fetchData() {
        defer { self.tableView.reloadData() }
        do {
            let realm = try Realm()
            ideaArr = realm.objects(Idea).sorted("createdAt", ascending: false)
        } catch { print(error) }
        if ideaArr?.count == 0 {

        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideaArr?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ideaCell", forIndexPath: indexPath) as! IdeaTableViewCell
        
        if let idea = ideaArr?[indexPath.row] {
            cell.configureCell(idea)
            
            switch idea.overallScore {
            case 0..<50:
                cell.backgroundColor = RedColor
            case 50..<75:
                cell.backgroundColor = YellowColor
            default:
                cell.backgroundColor = BlueColor
            }
        }

        
        return cell
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        if ideaArr?.count == 0 {
            performSegueWithIdentifier("newIdeaSegue", sender: self)
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showIdeaDetailSegue", sender: self)
    }
    @IBAction func addDidPress(sender: AnyObject) {
        performSegueWithIdentifier("newIdeaSegue", sender: self)
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .Destructive, title: "Delete") { action, indexPath in
            self.deleteIdea(indexPath)
        }
        return [deleteAction]
    }
    func deleteIdea(indexPath:NSIndexPath) {
        
        let realm = try! Realm()
        let idea = ideaArr![indexPath.row]
        realm.write {
            realm.delete(idea)
        }
        fetchData()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showIdeaDetailSegue" {
            let toVC = segue.destinationViewController as! IdeaDetailTableView
            let indexPath = tableView.indexPathForSelectedRow
            toVC.idea = ideaArr![indexPath!.row]
        }
    }
}