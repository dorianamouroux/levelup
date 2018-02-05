//
//  ProfilePageViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ProfilePageViewController: UIViewController, GIDSignInUIDelegate {
    var handle: NSObjectProtocol?

    
    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Profile"
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
