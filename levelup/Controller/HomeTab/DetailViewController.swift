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
    
    var data: Level?
    var fetchRandom = false
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var linkView: UILabel!
    @IBOutlet weak var featureListView: UITextView!
    @IBOutlet weak var bonusListView: UITextView!
    @IBOutlet weak var difficultyView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var platformView: UILabel!
    @IBOutlet weak var categoryView: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if fetchRandom == true {
            viewContainer.isHidden = true
            LevelManager.instance.getRandomLevel() { (err, level) in
                self.data = level
                self.displayContent()
            }
        }
        else {
            displayContent()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        data = nil
        fetchRandom = false
    }
    
    func displayContent() {
        guard let level = data else { return }

        nameView.text = level.name
        descriptionView.text = level.description
        
        if let link = level.link {
            linkView.text = "\(link)"
        } else {
            linkView.text = "No link"
        }
        
        featureListView.text = formatFeatureList(list: level.featureList, emptyValue: "No features")
        if let listBonus = level.featureListBonus {
            bonusListView.text = formatFeatureList(list: listBonus, emptyValue: "No bonus features")
        } else {
            bonusListView.text = "No bonus features"
        }
        difficultyView.text = displayFromEnum(level.difficulty)
        timeView.text = displayFromEnum(level.time)
        platformView.text = displayFromEnum(level.platform)
        categoryView.text = displayFromEnum(level.category)
        viewContainer.isHidden = false
    }
    
    func displayFromEnum(_ data: Any?) -> String {
        return String(describing: (data)!)
    }

}
