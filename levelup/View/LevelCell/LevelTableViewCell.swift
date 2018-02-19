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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layout(with level:Level) {
        contentText.text = level.name
    }
}

