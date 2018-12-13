//
//  Session.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/13/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import Foundation

class SessionThread: Codable, Equatable {
    
    var sessions: [SessionThread.Session]
    
    init(title: String) {
        self.title = title
        self.sessions = []
        self.identifier = UUID().uuidString
    }
    
    let title: String
    let identifier: String
    
    struct Session: Codable, Equatable {
        let text: String
        let sender: String
        let timestamp: Date
        
        static func ==(lhs: Session, rhs: Session) -> Bool {
            return lhs.text == rhs.text &&
                lhs.sender == rhs.sender &&
                lhs.timestamp == rhs.timestamp
        }
        
        init(text: String, sender: String) {
            self.text = text
            self.sender = sender
            self.timestamp = Date()
        }
    }
    
    static func ==(lhs: SessionThread, rhs: SessionThread) -> Bool {
        return lhs.title == rhs.title &&
            rhs.identifier == lhs.identifier &&
            rhs.sessions == lhs.sessions
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let sessionsDictionaries = try container.decodeIfPresent([String: Session].self, forKey: .sessions)
        
        let sessions = sessionsDictionaries?.compactMap({ $0.value }) ?? []
        
        self.title = title
        self.identifier = identifier
        self.sessions = sessions
    }
}

