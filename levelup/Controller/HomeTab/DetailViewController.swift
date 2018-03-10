//
//  DetailViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/21/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var data: Level?
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var featureListView: UITextView!
    @IBOutlet weak var bonusListView: UITextView!
    @IBOutlet weak var difficultyView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var platformView: UILabel!
    @IBOutlet weak var categoryView: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayContent()
    }
    
    func displayContent() {
        guard let level = data else { return }

        nameView.text = level.name
        descriptionView.text = level.description
        featureListView.text = formatFeatureList(list: level.featureList!, emptyValue: "No features")
        bonusListView.text = formatFeatureList(list: level.featureListBonus!, emptyValue: "No bonus features")
        difficultyView.text = displayFromEnum(level.difficulty)
        timeView.text = displayFromEnum(level.time)
        platformView.text = displayFromEnum(level.platform)
        categoryView.text = displayFromEnum(level.category)
    }
    
    func displayFromEnum(_ data: Any?) -> String {
        return String(describing: (data)!)
    }

}
