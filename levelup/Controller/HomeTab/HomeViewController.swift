//
//  HomeViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var levelList: UITableView!

    var levelData: [Level]?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        levelList.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "test")
        levelList.dataSource = self
        
        LevelManager.instance.getList() { (err, levels) in
            self.levelData = levels
            self.levelList.reloadData()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = levelData {
            return data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! LevelTableViewCell

        cell.layout(with: levelData![indexPath.row])

        return cell
    }
    
}


