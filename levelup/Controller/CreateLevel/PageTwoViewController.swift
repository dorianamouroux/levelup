//
//  PageTwoViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {

    @IBAction func previousPageAction(_ sender: Any) {

        if let parent = tabBarController as? CreateLevelController {
            parent.goToPage(0)
        }

    }
    
    
    @IBAction func nextPageAction(_ sender: Any) {
        if let parent = tabBarController as? CreateLevelController {
            parent.goToPage(2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
