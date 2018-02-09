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
    // class scope
    private var handle: NSObjectProtocol?
    
    // singleton
    static let instance = CustomUser()
    
    // user information
    var status:Status = .visitor
    var uid:String = ""
    var email:String?
    var photoURL:URL?
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.status = .user
                self.userIsSignedIn(user!)
            }
            else {
                self.status = .visitor
            }
            self.sendNotification("AuthChanged")
        }
    }
    
    deinit {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func userIsSignedIn(_ user: User) {
        uid = user.uid
        email = user.email
        photoURL = user.photoURL
        print(uid)
        print(email!)
        print(photoURL!)
    }
    
    func sendNotification(_ rawName:String) {
        let name = Notification.Name(rawValue: rawName)
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }

    func onChange(context: Any, callback:Selector) {
        let name = Notification.Name(rawValue: "AuthChanged")
        NotificationCenter.default.addObserver(context, selector: callback, name: name, object: nil)
    }
    
    func removeOnChange(context: Any) {
        NotificationCenter.default.removeObserver(context)
    }
}
