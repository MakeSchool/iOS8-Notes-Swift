//
//  NotesListTableViewController.swift
//  Notes-Swift
//
//  Created by Dion Larson on 11/13/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier! == "showNote" {
            var noteDetailViewController = segue.destinationViewController as NoteDetailViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow()
            noteDetailViewController.note = notes[selectedIndexPath!.row]
        } else if segue.identifier! == "addNote" {
            var note = Note()
            notes.append(note)
            var noteDetailViewController = segue.destinationViewController as NoteDetailViewController
            noteDetailViewController.note = note
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NotesCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = notes[indexPath.row].title
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        notes.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
}
