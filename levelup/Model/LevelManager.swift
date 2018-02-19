//
//  QuestionManager.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import Foundation
import Firebase


class LevelManager {

    // singleton
    static let instance = LevelManager()

    init() {}

    func query() {

    }
    
    func convertToModel(_ rawData:[String : Any]) -> Level {
        return Level(
            name: rawData["name"] as! String,
            description: "yo"
        )
    }
    
    func getList(cb: @escaping (_ err: String?, _ levels: [Level]) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("level")
        
        
        docRef.getDocuments () { (querySnapshot, err) in
            var levels = [Level]()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    levels.append(self.convertToModel(document.data()))
                }
            }
            cb(nil, levels)
        }
    }
    
}
