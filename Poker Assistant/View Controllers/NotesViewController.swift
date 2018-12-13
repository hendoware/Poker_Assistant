//
//  PlayerNotesViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/10/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var notesOutlet: UITextView!
    var note: SessionThread.Session?
    var messageThread: SessionThread?
    var messageThreadController: SessionThreadController?
    
    @IBAction func saveAction(_ sender: Any) {
        guard let messageThreadController = messageThreadController,
            let messageThread = messageThread,
            let sender = titleField.text,
            let text = notesOutlet.text else { return }

        messageThreadController.createSession(in: messageThread, text: text, sender: sender) { (error) -> (Void) in
            DispatchQueue.main.async { self.navigationController?.popViewController(animated: true) }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let session = note else { return }

        if session.text == "" { title = session.sender } else {
            title = session.text
        }

        titleField.text = session.sender
        notesOutlet.text = session.text
    }
}
