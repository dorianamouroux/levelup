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
    private init() {}
    
    func getRandomToken() -> Int64 {
        return Int64(arc4random()) &+ (Int64(arc4random()) << 32)
    }
    
    func convertToModel(_ rawData:[String : Any]) -> Level {
        return Level(
            name: rawData["name"] as! String,
            description: (rawData["description"] as? String) ?? "No description",
            link: URL(string: (rawData["link"] as? String) ?? ""),
            featureList: (rawData["featureList"] as? [String]) ?? [],
            featureListBonus: (rawData["featureListBonus"] as? [String]) ?? [],
            difficulty: Difficulty(rawValue: (rawData["difficulty"] as? Int) ?? Difficulty.undefined.rawValue)!,
            time: Time(rawValue: (rawData["time"] as? Int) ?? Time.undefined.rawValue)!,
            category: Category(rawValue: (rawData["category"] as? Int) ?? Category.undefined.rawValue)!,
            platform: Platform(rawValue: (rawData["platform"] as? Int) ?? Platform.undefined.rawValue)!
        )
    }
    
    func getRandomLevel(cb: @escaping (_ err: String?, _ level: Level?) -> Void)  {
        let db = Firestore.firestore()
        let docRef = db.collection("level")
        
        let randomToken = getRandomToken()
        
        var queryRef = docRef.whereField("token", isGreaterThan: randomToken)
            .order(by: "token")
            .limit(to: 1)
        
        queryRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let documents = querySnapshot!.documents
                
                if documents.count == 1 {
                    cb(nil, self.convertToModel(documents[0].data()))
                }
                else {
                    queryRef = docRef.whereField("token", isLessThanOrEqualTo: randomToken)
                        .order(by: "token", descending: true)
                        .limit(to: 1)
                    
                    queryRef.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            let documents = querySnapshot!.documents
                            
                            if documents.count == 1 {
                                cb(nil, self.convertToModel(documents[0].data()))
                            }
                            else {
                                cb(nil, nil)
                            }
                        }
                    }
                }
            }
        }
    
    }
    
    func getList(ofCurrentUser:Bool = false, cb: @escaping (_ err: String?, _ levels: [Level]) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("level")
        var queryRef:Query

        if ofCurrentUser {
            queryRef = docRef.whereField("user", isEqualTo: CustomUser.instance.uid)
        } else {
            queryRef = docRef as Query
        }
        
        queryRef.getDocuments() { (querySnapshot, err) in
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
    
    func addLevelToDb(level: Level, cb: @escaping (_ err: String?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("level")
 
        let data: [String: Any] = [
            "name": level.name as Any,
            "description": level.description as Any,
            "link": level.link?.absoluteString as Any,
            "featureList": level.featureList as Any,
            "featureListBonus": level.featureListBonus as Any,
            "difficulty": level.difficulty.rawValue as Any,
            "time": level.time.rawValue as Any,
            "category": level.category.rawValue as Any,
            "platform": level.platform.rawValue as Any,
            "token": getRandomToken(),
            "user": CustomUser.instance.uid,
        ]
        docRef.addDocument(data: data) { err in
            if let err = err {
                cb("\(err)")
            } else {
                cb(nil)
            }
        }
    }
    
}
