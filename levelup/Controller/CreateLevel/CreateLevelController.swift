//
//  CreateLevelController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit


class CreateLevelController: UITabBarController {
    var level = Level()

    func goToPage(_ index: Int) {
        selectedIndex = index
    }
    
    func goToPageTwo(nameValue: String, descriptionValue: String, urlValue: String?) {
        level.name = nameValue
        level.description = descriptionValue
        if let url = urlValue {
            level.link = URL(string: url)
        }
        goToPage(1)
    }
    
    func goToPageThree(featureList: [String], bonusList: [String]) {
        level.featureList = featureList
        level.featureListBonus = bonusList
        goToPage(2)
    }
    
    func finishForm(
        difficulty: Int,
        time: Int,
        category: Int,
        platform: Int) {
        level.difficulty = Difficulty(rawValue: difficulty)!
        level.time = Time(rawValue: time)!
        level.category = Category(rawValue: category)!
        level.platform = Platform(rawValue: platform)!
        
        LevelManager.instance.addLevelToDb(level: level) { (err) in
            if let error = err {
                Utils.errorPopupWithOk(error, vc: self)
            } else {
                self.performSegue(withIdentifier: "unwindToDetail", sender: self)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.navigationItem.title = "Create Level"
        tabBar.isHidden = true
        
        goToPage(0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "unwindToDetail") {
            let vc = segue.destination as! DetailViewController;
            vc.data = level
        }
    }

}
