//
//  DetailViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/21/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func unwindToDetail(segue:UIStoryboardSegue) { }

    var fetchRandom = false
    var data: Level?
    
    @IBOutlet weak var viewContainer: DetailLevelView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if fetchRandom == true {
            viewContainer.isHidden = true
            LevelManager.instance.getRandomLevel() { (err, level) in
                self.viewContainer.data = level
            }
        } else {
            self.viewContainer.data = data
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        fetchRandom = false
    }

}
