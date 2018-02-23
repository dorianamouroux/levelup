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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayContent()
    }
    
    func displayContent() {
        nameView.text = data?.name
        descriptionView.text = data?.description
    }
}
