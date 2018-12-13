//
//  SessionViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/10/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class SessionDetailViewController: UIViewController {
    
    
    @IBOutlet weak var cashOutOutlet: UITextField!
    @IBOutlet weak var dateOutlet: UITextField!
    
    var session: SessionThread.Session?
    var sessionThread: SessionThread?
    var sessionThreadController: SessionThreadController?
    
    @IBAction func saveAction(_ sender: Any) {
        guard let sessionThreadController = sessionThreadController,
            let sessionThread = sessionThread,
            let sender = cashOutOutlet.text,
            let text = dateOutlet.text else { return }
        
        sessionThreadController.createSession(in: sessionThread, text: text, sender: sender) { (error) -> (Void) in
            DispatchQueue.main.async { self.navigationController?.popViewController(animated: true) }
        }
        self.navigationController?.pushViewController(NotesViewController(), animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let session = session else { return }
        
        if session.text == "" { title = session.sender } else {
            title = session.text
        }
        
        cashOutOutlet.text = session.sender
        dateOutlet.text = session.text
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.pushViewController(CalculatorViewController(), animated: true)
        dismiss(animated: true, completion: nil)
    }
}

extension UILabel
{
    func setMoney(_ v:Int?, _ fmt:String="%@")
    {
        guard let v = v else {return}
        
        let f = NumberFormatter()
        f.numberStyle = .currency
        if let m = f.string(from: NSNumber(value: Double(v) / 100.0)) {
            self.text = String(format: fmt, m)
        }
    }
}

extension String
{
    static func fromMoney(_ v:Int?) -> String?
    {
        guard let v = v else {return nil}
        
        let f = NumberFormatter()
        f.numberStyle = .currency
        if let m = f.string(from: NSNumber(value: Double(v) / 100.0)) {
            return m
        }
        return nil
    }
    
    static func toMoney(_ text:String) -> Int?
    {
        let numbers = text.filter { "0123456789".contains($0) }
        return Int(numbers)
    }
}

extension UITextField
{
    func setMoney(_ v:Int?)
    {
        guard let v = v else {return}
        
        let f = NumberFormatter()
        f.numberStyle = .currency
        if let m = f.string(from: NSNumber(value: Double(v) / 100.0)) {
            self.text = m
        }
    }
    
    func getMoneyAsInt() -> Int?
    {
        let text = self.text ?? ""
        let numbers = text.filter { "0123456789".contains($0) }
        return Int(numbers)
    }
}
