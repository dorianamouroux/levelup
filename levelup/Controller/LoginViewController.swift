//
//  LoginViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInUIDelegate {
    var handle: NSObjectProtocol?

    @IBAction func loginGoogleAction() {
        GIDSignIn.sharedInstance().signIn()
    }

    func userIsSignedIn(_ user: User) {
        let uid = user.uid
        let email = user.email
        let photoURL = user.photoURL
        print(uid)
        print(email!)
        print(photoURL!)
    }
    
    func userIsAnonymous() {
        
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.userIsSignedIn(user)
            }
            else {
                self.userIsAnonymous()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
