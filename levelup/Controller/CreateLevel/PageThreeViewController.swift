//
//  PageThreeViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class PageThreeViewController: UIViewController {

    
    @IBOutlet weak var difficultyInput: UISegmentedControl!
    @IBOutlet weak var timeInput: UISegmentedControl!
    @IBOutlet weak var categoryInput: UISegmentedControl!
    @IBOutlet weak var platformInput: UISegmentedControl!
    
    @IBAction func previousPageAction(_ sender: Any) {
        if let parent = tabBarController as? CreateLevelController {
            parent.goToPage(1)
        }
    }
    
    @IBAction func nextPageAction(_ sender: Any) {
        if let parent = tabBarController as? CreateLevelController {
            parent.finishForm(
                difficulty: difficultyInput.selectedSegmentIndex,
                time: timeInput.selectedSegmentIndex,
                category: categoryInput.selectedSegmentIndex,
                platform: platformInput.selectedSegmentIndex
            )
        }
    }


}
