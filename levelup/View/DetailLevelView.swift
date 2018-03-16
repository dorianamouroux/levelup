//
//  DetailLevelView.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/16/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class DetailLevelView: UIView {

    var data: Level? {
        didSet { displayContent() }
    }
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var linkView: UILabel!
    @IBOutlet weak var featureListView: UITextView!
    @IBOutlet weak var bonusListView: UITextView!
    @IBOutlet weak var difficultyView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var platformView: UILabel!
    @IBOutlet weak var categoryView: UILabel!
    
    
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
    }
    
    func displayFromEnum(_ data: Any?) -> String {
        guard let item = data else { return "Not specified" }
        return String(describing: item)
    }


}
