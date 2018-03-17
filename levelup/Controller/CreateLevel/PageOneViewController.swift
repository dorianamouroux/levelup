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
        
//        [yourTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
//        [yourTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
//        [yourTextView.layer setBorderWidth: 1.0];
//        [yourTextView.layer setCornerRadius:8.0f];
//        [yourTextView.layer setMasksToBounds:YES];
        
        descriptionField.layer.backgroundColor = UIColor.white.cgColor
        descriptionField.layer.borderColor = UIColor.lightGray.cgColor
        descriptionField.layer.borderWidth = 1.0
        descriptionField.layer.cornerRadius = 8.0
        descriptionField.layer.masksToBounds = true
    }

    func validate() -> Bool {
        guard let nameValue = nameField?.text else { return false }
        guard let descriptionValue = descriptionField?.text else { return false }
        
        
        if nameValue.count > 0 && descriptionValue.count > 0 {
            return true
        }
        
        // alert the user to give him the error
        Utils.errorPopupWithOk("You need to give a name and description to your project", vc: self)
        return false
    }
    

}
