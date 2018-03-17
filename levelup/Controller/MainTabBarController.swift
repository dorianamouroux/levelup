//
//  mainTabBarController.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/11/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import IoniconsKit


class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setIcons()
        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? DetailViewController {
            vc.fetchRandom = true
        }
        return true
    }

    func setIcons() {
        if let tabHome = tabBar.items?[0] {
            setItemTheme(item: tabHome, title: "Home", icon: .iosListOutline, iconSelect: .iosList)
        }

        if let tabRandomLevel = tabBar.items?[1] {
            setItemTheme(item: tabRandomLevel, title: "Random", icon: .iosColorWandOutline, iconSelect: .iosColorWand)
        }

        if let tabUser = tabBar.items?[2] {
            setItemTheme(item: tabUser, title: "User", icon: .iosPersonOutline, iconSelect: .iosPerson)
        }
    }
    
    func setItemTheme(item: UITabBarItem, title: String, icon: Ionicons, iconSelect: Ionicons) {
        item.title = title
        item.image = UIImage.ionicon(with: icon, textColor: UIColor.lightGray, size: CGSize(width: 32, height: 32)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item.selectedImage = UIImage.ionicon(with: iconSelect, textColor: UIColor.white, size: CGSize(width: 32, height: 32)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for:.normal)
        item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for:.selected)
        print(item)
    }
    
}
