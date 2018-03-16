//
//  HomeViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 2/15/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // refs
    weak var refNavigationItem: UINavigationItem?
    
    // outlets
    @IBOutlet weak var levelList: UITableView!
    
    // what will be in the table view
    var levelData: [Level]?

    // pull to refresh on the table view
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        
        let button = UIBarButtonItem(title: "New", style: .done, target: self, action: #selector(newLevel))
        refNavigationItem?.rightBarButtonItem = button
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        refNavigationItem?.rightBarButtonItem = nil
    }
    
    @objc func newLevel() {
        if CustomUser.instance.status == .user {
            performSegue(withIdentifier: "createLevelSegue", sender: nil)
        }
        else {
            Utils.errorPopupWithOk("Login first!", vc: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refNavigationItem = tabBarController!.navigationItem
        

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
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        LevelManager.instance.getList() { (err, levels) in
            self.levelData = levels
            self.levelList.reloadData()
            refreshControl.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailLevel", sender: levelData![indexPath.row])
    }
    
}
