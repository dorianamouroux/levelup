//
//  PageOneViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/28/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    
    @IBAction func clickNextButton(_ sender: Any) {

        guard validate() else { return }

        if let parent = tabBarController as? CreateLevelController {
            
            let nameValue = nameField?.text
            let descriptionValue = descriptionField?.text
            let urlValue = urlField?.text
            
            parent.goToPageTwo(nameValue: nameValue!, descriptionValue: descriptionValue!, urlValue: urlValue)

        }

    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var urlField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionField.layer.borderColor = nameField.layer.borderColor
        descriptionField.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validate() -> Bool {
        guard let nameValue = nameField?.text else { return false }
        guard let descriptionValue = descriptionField?.text else { return false }
        
        
        if nameValue.count > 5 && descriptionValue.count > 5 {
            return true
        }
        
        // alert the user to give him the error
        let alert = UIAlertController(title: "Error", message: "You need to give a name and description to your project", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        return false
    }
    

}
