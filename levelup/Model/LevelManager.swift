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
            description: "yo",
            link: URL(string: "http://www.github.com")!,
            featureList: ["a", "b"],
            featureListBonus: ["test", "test"],
            difficulty: Difficulty.advanced,
            time: Time.short,
            category: Category.game,
            platform: Platform.console
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
        
//        self.name = name
//        self.description = description
//        self.link = link
//        self.featureList = featureList
//        self.featureListBonus = featureListBonus
//        self.difficulty = difficulty
//        self.time = time
//        self.category = category
//        self.platform = platform
        let data: [String: Any] = [
            "name": level.name,
            "description": level.description,
            "link": level.link,
            "featureList": level.featureList,
            "featureListBonus": level.featureListBonus,
            "difficulty": level.difficulty?.rawValue,
            "time": level.time?.rawValue,
            "category": level.category?.rawValue,
            "platform": level.platform?.rawValue,
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
