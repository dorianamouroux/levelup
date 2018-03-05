//
//  CreateLevelController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit


class CreateLevelController: UITabBarController {
    
    func goToPage(_ index: Int) {
        selectedIndex = index
    }
    
    func finishForm() {
        print("FINISHH")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
