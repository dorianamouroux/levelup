//
//  UserViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/6/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit


class UserViewController: UINavigationController {
    var handle: NSObjectProtocol?
    
    @objc func userStatusLoaded() {
        var identifier: String
        let user = CustomUser.instance

        if user.status == .user {
            identifier = "profileView"
        }
        else {
            identifier = "loginView"
        }
        let vc:UIViewController = storyboard?.instantiateViewController(withIdentifier: identifier) as! UIViewController
        setViewControllers([vc], animated: false)
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)

        let name = Notification.Name(rawValue: "AuthChanged")
        NotificationCenter.default.addObserver(
            self, selector: #selector(userStatusLoaded),
            name: name, object: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
