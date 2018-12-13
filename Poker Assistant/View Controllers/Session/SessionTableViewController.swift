//
//  SessionTableViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/13/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class SessionTableViewController: UITableViewController {
    
    var sessionThread: SessionThread?
    var sessionThreadController: SessionThreadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sessionThreadTitle = sessionThread?.title else { return }
        title = sessionThreadTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sessions = sessionThread?.sessions else { return 0 }
        return sessions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath)
        
        guard let sessions = sessionThread?.sessions else { return cell }
        let session = sessions[indexPath.row]
        
        cell.textLabel?.text = session.text
        cell.detailTextLabel?.text = session.sender
        
        return cell
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.pushViewController(CalculatorViewController(), animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SessionDetailViewController,
            let sessionThread = sessionThread else { return }
        destination.sessionThreadController = sessionThreadController
        destination.sessionThread = sessionThread
        guard let index = sessionThreadController?.sessionThreads.index(of: sessionThread),
            let indexRow = tableView.indexPathForSelectedRow?.row,
            let session = sessionThreadController?.sessionThreads[index].sessions[indexRow] else { return }
        destination.session = session
    }
}
