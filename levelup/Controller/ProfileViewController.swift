//
//  ProfilePageViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase


class ProfileViewController: UIViewController {
    
    @IBAction func logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        let button = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutMenu))
        //        navigationItem.rightBarButtonItems = [button]
        navigationItem.rightBarButtonItem = button
        print(navigationItem.rightBarButtonItem)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let button = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutMenu))
////        navigationItem.rightBarButtonItems = [button]
//        navigationItem.setRightBarButton(button, animated: false)
    }
    
    @objc func logoutMenu() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
