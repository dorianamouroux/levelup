//
//  UserViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/6/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit


class UserViewController: UIViewController {
    
    @objc func userStatusLoaded() {
        let user = CustomUser.instance
        let identifier = user.status == .user ? "profileView" : "loginView" // choose the right VC
        let controller:UIViewController = storyboard!.instantiateViewController(withIdentifier: identifier)
        
        // add the view to the page
        addChildViewController(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        // make the subview (profile or login) fill the space
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        controller.didMove(toParentViewController: self)
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
