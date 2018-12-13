//
//  SessionThreadsTVC.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/13/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class SessionThreadsTVC: UITableViewController {
    
    let sessionThreadController = SessionThreadController()
    let sessionTableViewController = SessionTableViewController()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchThreads(_:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchThreads(self)
        self.tableView.reloadData()
    }
    
    @objc private func fetchThreads(_ sender: Any) {
        sessionThreadController.fetchSessionThreads { (error) -> (Void) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionThreadController.sessionThreads.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThreadSession", for: indexPath)
        
        cell.textLabel?.text = sessionThreadController.sessionThreads[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let session = sessionThreadController.sessionThreads[indexPath.row]
            sessionThreadController.delete(sessionThread: session)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func textAction(_ sender: Any) {
        guard let threadTitle = textField.text else { return }
        sessionThreadController.createSessionThread(with: threadTitle) { (error) -> (Void) in
            self.fetchThreads(self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SessionDetail" {
            guard let destination = segue.destination as? SessionTableViewController,
                let index = tableView.indexPathForSelectedRow?.row else { return }
            destination.sessionThreadController = sessionThreadController
            destination.sessionThread = sessionThreadController.sessionThreads[index]
        }
    }
}
