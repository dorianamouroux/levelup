//
//  PageTwoViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {

    
    // feature
    var featureList:[String] = [] {
        didSet {
            featureOutput?.text = formatFeatureList(list: featureList)
        }
    }
    @IBOutlet weak var featureInput: UITextField!
    @IBAction func featureAdd(_ sender: Any) {
        guard let featureValue = featureInput?.text else { return }
    
        if featureValue.count > 0 {
            featureList.append(featureValue)
            featureInput?.text = ""
            removeButton.isHidden = false
        }
        else {
            errorMessage("You need to write a feature")
        }
    }
    @IBOutlet weak var removeButton: UIButton!
    @IBAction func removeLastFeature(_ sender: Any) {
        featureList.removeLast()
        if featureList.count == 0 {
            removeButton.isHidden = true
        }
    }
    @IBOutlet weak var featureOutput: UITextView!
    
    // bonus feature
    var bonusList:[String] = [] {
        didSet {
            bonusOutput?.text = formatFeatureList(list: bonusList)
        }
    }
    @IBOutlet weak var bonusInput: UITextField!
    @IBAction func bonusAdd(_ sender: Any) {
        guard let featureValue = bonusInput?.text else { return }
        
        if featureValue.count > 0 {
            bonusList.append(featureValue)
            bonusInput?.text = ""
            removeButtonBonus.isHidden = false
        }
        else {
            errorMessage("You need to write a feature")
        }
    }
    @IBOutlet weak var bonusOutput: UITextView!
    @IBOutlet weak var removeButtonBonus: UIButton!
    @IBAction func removeLastBonus(_ sender: Any) {
        bonusList.removeLast()
        if bonusList.count == 0 {
            removeButtonBonus.isHidden = true
        }
    }
    
    @IBAction func previousPageAction(_ sender: Any) {

        if let parent = tabBarController as? CreateLevelController {
            parent.goToPage(0)
        }

    }
    
    
    @IBAction func nextPageAction(_ sender: Any) {
        if featureList.count < 2 {
            errorMessage("You need to specify at least two features.")
            return
        }
        
        if let parent = tabBarController as? CreateLevelController {
            parent.goToPageThree(featureList: featureList, bonusList: bonusList)
        }
    }
    
    func errorMessage(_ message:String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
