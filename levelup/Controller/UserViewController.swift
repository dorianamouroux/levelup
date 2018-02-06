//
//  UserViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/6/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class UserViewController: UINavigationController, GIDSignInUIDelegate {
    var handle: NSObjectProtocol?
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)

        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            var identifier: String
            if user != nil {
                identifier = "profileView"
            }
            else {
                identifier = "loginView"
            }
            let vc : UIViewController? = self.storyboard?.instantiateViewController(withIdentifier: identifier) as? UIViewController
            if let view = vc {
                self.setViewControllers([view], animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
