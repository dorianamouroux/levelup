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
            description: (rawData["description"] as? String) ?? "No description",
            link: URL(string: (rawData["link"] as? String) ?? ""),
            featureList: (rawData["featureList"] as? [String]) ?? [],
            featureListBonus: (rawData["featureListBonus"] as? [String]) ?? [],
            difficulty: Difficulty(rawValue: (rawData["difficulty"] as? Int) ?? -1)!,
            time: Time(rawValue: (rawData["time"] as? Int) ?? -1)!,
            category: Category(rawValue: (rawData["category"] as? Int) ?? -1)!,
            platform: Platform(rawValue: (rawData["platform"] as? Int) ?? -1)!
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
    
    func addLevelToDb(level: Level) {
        let db = Firestore.firestore()
        let docRef = db.collection("level")
 
        let data: [String: Any] = [
            "name": level.name as Any,
            "description": level.description as Any,
            "link": level.link?.absoluteString as Any,
            "featureList": level.featureList as Any,
            "featureListBonus": level.featureListBonus as Any,
            "difficulty": level.difficulty?.rawValue as Any,
            "time": level.time?.rawValue as Any,
            "category": level.category?.rawValue as Any,
            "platform": level.platform?.rawValue as Any,
            "token": level.uniqueToken
        ]
        docRef.addDocument(data: data) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
