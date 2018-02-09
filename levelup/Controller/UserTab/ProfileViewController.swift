//
//  ProfilePageViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ProfileViewController: UIViewController {

    // refs
    weak var refNavigationItem: UINavigationItem?
    weak var user: CustomUser?
    
    // outlet
    @IBOutlet weak var userPictureView: UIImageView!
    @IBOutlet weak var userNameView: UILabel!

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        refNavigationItem = tabBarController!.navigationItem

        let button = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutMenu))
        refNavigationItem?.rightBarButtonItem = button
        
        if let displayName = user?.displayName {
            userNameView.text = "Hi \(displayName)"
        }

        if let photoUrl = user?.photoURL {
            userPictureView.kf.setImage(with: photoUrl)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        refNavigationItem?.rightBarButtonItem = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = CustomUser.instance
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
