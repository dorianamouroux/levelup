//
//  format.swift
//  levelup
//
//  Created by Dorian Amouroux on 3/10/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import Foundation


func formatFeatureList(list:[String], emptyValue:String = "") -> String {
    if list.count == 0 {
        return emptyValue
    }
    else {
        return "- " + list.joined(separator: "\n- ")
    }
}
