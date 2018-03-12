//
//  popup.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/12/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import Foundation
import UIKit


func errorPopupWithOk(_ message: String, vc: UIViewController) {
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
