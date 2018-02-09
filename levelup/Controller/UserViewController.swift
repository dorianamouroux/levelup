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
        let user = CustomUser.instance
        let identifier = user.status == .user ? "profileView" : "loginView" // choose the right VC
        let vc:UIViewController = storyboard!.instantiateViewController(withIdentifier: identifier)
        setViewControllers([vc], animated: false)
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        let name = Notification.Name(rawValue: "AuthChanged")
        NotificationCenter.default.addObserver(
            self, selector: #selector(userStatusLoaded),
            name: name, object: nil
        )
        userStatusLoaded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
