//
//  Level.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import Foundation

enum Difficulty: Int {
    case undefined = -1, beginner, advanced, expert
}

enum Category: Int {
    case undefined = -1, application, tool, game
}

enum Time: Int {
    case undefined = -1, short, medium, long
}

enum Platform: Int {
    case undefined = -1, mobile, website, desktop, console
}

class Level {

    var name: String
    var description: String
    var link: URL?
    var featureList: [String]
    var featureListBonus: [String]?
    var difficulty: Difficulty
    var time: Time
    var category: Category
    var platform: Platform

    init(name: String = "",
         description: String = "",
         link: URL? = nil,
         featureList: [String] = [],
         featureListBonus: [String]? = [],
         difficulty: Difficulty = Difficulty.undefined,
         time: Time = Time.undefined,
         category: Category = Category.undefined,
         platform: Platform = Platform.undefined
        ) {
        self.name = name
        self.description = description
        self.link = link
        self.featureList = featureList
        self.featureListBonus = featureListBonus
        self.difficulty = difficulty
        self.time = time
        self.category = category
        self.platform = platform
    }
    
}
