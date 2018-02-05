//
//  MenuViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


enum StateUser {
    case anonymous
    case signed
}

class MenuViewController: UITabBarController, GIDSignInUIDelegate {
    var handle: NSObjectProtocol?
    var mode:StateUser = .anonymous

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.mode = .signed
            }
            else {
                self.mode = .anonymous
            }
        }
    }
    
    func getLastMenu(tag: Int) -> UIViewController {
        if self.mode == .anonymous {
            let userViewController = ProfilePageViewController()
            userViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: tag)
            userViewController.tabBarItem.title = "Login"
            return userViewController
        }
        else {
            let userViewController = LoginViewController()
            userViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: tag)
            userViewController.tabBarItem.title = "Profil"
            return userViewController
        }
    }
    
    func adaptMenuUserStatus() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        homeViewController.tabBarItem.title = "Home"

        let viewControllersList = [ homeViewController,  getLastMenu(tag: 1) ]
        
        viewControllers = viewControllersList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
