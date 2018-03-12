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
        
        CustomUser.instance.onChange(context: self, callback: #selector(userStatusLoaded))
        userStatusLoaded() // initial load
    }
    
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
        
        CustomUser.instance.removeOnChange(context: self)
    }
}
