//
//  Note.swift
//  Notes-Swift
//
//  Created by Dion Larson on 11/13/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

import Foundation
import CoreData

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var content: String
}