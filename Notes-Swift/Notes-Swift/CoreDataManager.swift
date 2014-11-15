//
//  CoreDataManager.swift
//  Notes-Swift
//
//  Created by Dion Larson on 11/14/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    class var sharedInstance: CoreDataManager {
        struct Static {
            static let instance: CoreDataManager = CoreDataManager()
        }
        return Static.instance
    }
    
    func saveContext() {
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.saveContext()
    }
    
    func createNewNote() -> Note {
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context = appDelegate.managedObjectContext!
        var newNote = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as Note
        
        newNote.title = ""
        newNote.content = ""
        
        self.saveContext()
        
        return newNote
    }
    
    func deleteNote(note: Note) {
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context = appDelegate.managedObjectContext!
        
        context.deleteObject(note)
        
        self.saveContext()
    }
    
    func fetchNotes() -> [Note] {
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context = appDelegate.managedObjectContext!
        
        var entityDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: context)
        var request = NSFetchRequest()
        request.entity = entityDescription
        
        var error: NSError?
        let notes = context.executeFetchRequest(request, error: &error)
        
        return notes! as [Note]
    }
    
}
