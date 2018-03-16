//
//  Utils.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/16/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Foundation

class Utils {
    
    // Flatten a stringc list to one string per line, starting with a dash
    // If list is empty, return the emptyValue
    static func formatFeatureList(list:[String], emptyValue:String = "") -> String {
        if list.count == 0 {
            return emptyValue
        }
        else {
            return "- " + list.joined(separator: "\n- ")
        }
    }
    
    // Display a UIAlertController with a message and a "Ok" button to dismiss
    static func errorPopupWithOk(_ message: String, vc: UIViewController) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
