//
//  LevelTableViewCell.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/19/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class LevelTableViewCell: UITableViewCell {

    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var difficultyText: UILabel!
    @IBOutlet weak var durationText: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layout(with level:Level) {
        contentText.text = level.name
        difficultyText.text = displayFromEnum(level.difficulty)
        durationText.text = displayFromEnum(level.time)
    }
    
    func displayFromEnum(_ data: Any?) -> String {
        guard let item = data else { return "Not specified" }
        return String(describing: item)
    }
}

