//
//  mainTabBarController.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/11/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? DetailViewController {
            vc.fetchRandom = true
        }
        return true
    }

}
