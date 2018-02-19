//
//  HomeViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {

    let levelData = LevelManager.getList()
    
    @IBOutlet weak var levelList: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        levelList.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "test")
        levelList.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! LevelTableViewCell

        cell.layout(with: levelData[indexPath.row])

        return cell
    }
    
}


