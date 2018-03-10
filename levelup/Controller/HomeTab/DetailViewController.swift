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
        nameView.text = data?.name
        descriptionView.text = data?.description
        featureListView.text = formatFeatureList(data?.featureList)
        bonusListView.text = formatFeatureList(data?.featureListBonus)
        difficultyView.text = displayFromEnum(data?.difficulty)
        timeView.text = displayFromEnum(data?.time)
        platformView.text = displayFromEnum(data?.platform)
        categoryView.text = displayFromEnum(data?.category)
    }
    
    func displayFromEnum(_ data: Any?) -> String {
        return String(describing: (data)!)
    }
    
    func formatFeatureList(_ features: [String]?) -> String {
        return "yo"
    }
}
