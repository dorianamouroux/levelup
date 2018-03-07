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
    
    func goToPageTwo(nameValue: String, descriptionValue: String, urlValue: String?) {
        print(nameValue)
        print(descriptionValue)
        print(urlValue as Any)
        goToPage(1)
    }
    
    func finishForm() {
        print("FINISHH")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.navigationItem.title = "Create Level"
        tabBar.isHidden = true
        
        goToPage(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
