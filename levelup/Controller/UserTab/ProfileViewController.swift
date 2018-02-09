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

    weak var refNavigationItem: UINavigationItem?

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        refNavigationItem = tabBarController!.navigationItem

        let button = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutMenu))
        refNavigationItem?.rightBarButtonItem = button
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        refNavigationItem?.rightBarButtonItem = nil
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
