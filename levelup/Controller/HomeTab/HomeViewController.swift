//
//  HomeViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var levelList: UITableView!

    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
    
        refreshControl.addTarget(self, action:
                #selector(handleRefresh),
                for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red

        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        LevelManager.instance.getList() { (err, levels) in
            print(levels)
            self.levelData = levels
            self.levelList.reloadData()
            refreshControl.endRefreshing()
        }
    }
    
    var levelData: [Level]?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        levelList.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "test")
        levelList.dataSource = self
        levelList.delegate = self
        levelList.addSubview(self.refreshControl)
        levelList.tableFooterView = UIView()

        LevelManager.instance.getList() { (err, levels) in
            self.levelData = levels
            self.levelList.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailLevel") {
            let vc = segue.destination as! DetailViewController;
            vc.data = sender as? Level
        }
    }
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailLevel", sender: levelData![indexPath.row])
    }
    
}
