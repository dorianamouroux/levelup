//
//  User.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/7/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import Foundation
import Firebase

enum Status {
    case visitor, user
}

class CustomUser {
    var handle: NSObjectProtocol?
    var status:Status = .visitor
    static let instance = CustomUser()
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.status = .user
            }
            else {
                self.status = .visitor
            }
            self.sendNotification("AuthChanged")
        }
    }
    
    func sendNotification(_ rawName:String) {
        let name = Notification.Name(rawValue: rawName)
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
}
