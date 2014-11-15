//
//  NoteDetailViewController.swift
//  Notes-Swift
//
//  Created by Dion Larson on 11/13/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    
    @IBOutlet weak var titleTextFied: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    var note: Note!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextFied.text = note.title
        contentTextField.text = note.content
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        note.title = titleTextFied.text
        note.content = contentTextField.text
    }
    
}
