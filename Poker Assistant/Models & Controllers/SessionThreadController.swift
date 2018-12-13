//
//  SessionThreadController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/13/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import Foundation

class SessionThreadController {
    
    var sessionThreads: [SessionThread] = []
    static let baseURL = URL(string: "https://poker-assist.firebaseio.com/")!
    var persistentFileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("sessionThreads.json")
    
    func createSessionThread(with title: String, completion: @escaping (Error?) -> (Void)) {
        let sessionThread = SessionThread(title: title)
        let url = SessionThreadController.baseURL
            .appendingPathComponent(sessionThread.identifier)
            .appendingPathComponent(".json")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        do {
            request.httpBody = try JSONEncoder().encode(sessionThread)
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    NSLog("Error PUTing session thread title in Firebase: \(error)")
                    completion(error)
                }
                self.sessionThreads.append(sessionThread)
                NSLog("PUT successful")
                completion(nil)
                }.resume()
        } catch {
            fatalError("Error encoding session thread title: \(error)")
        }
    }
    
    func createSession(in thread: SessionThread, text: String, sender: String, completion: @escaping (Error?) -> (Void)) {
        let session = SessionThread.Session(text: text, sender: sender)
        let url = SessionThreadController.baseURL
            .appendingPathComponent(thread.identifier)
            .appendingPathComponent("messages")
            .appendingPathComponent(".json")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONEncoder().encode(session)
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    NSLog("Error POSTing session thread title in Firebase: \(error)")
                    completion(error)
                }
                thread.sessions.append(session)
                NSLog("POST successful")
                completion(nil)
                }.resume()
        } catch {
            fatalError("Error encoding session: \(error)")
        }
    }
    
    func delete(sessionThread: SessionThread) {
        guard let index = sessionThreads.index(of: sessionThread) else { return }
        sessionThreads.remove(at: index)
//        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let encodedMemories = try encoder.encode(sessionThreads)
            try encodedMemories.write(to: persistentFileURL)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchSessionThreads(completion: @escaping (Error?) -> (Void)) {
        let url = SessionThreadController.baseURL.appendingPathComponent(".json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let _ = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error GETing data from Firebase: \(error)")
                completion(error)
                return
            }
            guard let data = data else {
                NSLog("No data returned from Firebase API")
                completion(NSError())
                return
            }
            let response = String(data: data, encoding: .utf8)
            if response == "null" {
                NSLog("No data to work with")
                completion(nil)
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let sessionThreadDictionaries = try jsonDecoder.decode([String: SessionThread].self, from: data)
                self.sessionThreads = sessionThreadDictionaries.map { $0.value }
                completion(nil)
            } catch {
                NSLog("Unable to decode data: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
}
