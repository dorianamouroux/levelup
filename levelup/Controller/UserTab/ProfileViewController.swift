//
//  ProfilePageViewController.swift
//  levelup
//
//  Created by Dorian Amouroux on 1/25/18.
//  Copyright © 2018 Dorian Amouroux. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ProfileViewController: UIViewController {

    // refs
    weak var refNavigationItem: UINavigationItem?
    weak var user: CustomUser?
    
    // outlet
    @IBOutlet weak var userPictureView: UIImageView!
    @IBOutlet weak var userNameView: UILabel!
    @IBOutlet weak var levelListView: UITableView!
    
    var levelData:[Level]?
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        refNavigationItem = tabBarController!.navigationItem

        let button = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutMenu))
        refNavigationItem?.rightBarButtonItem = button
        
        if let displayName = user?.displayName {
            userNameView.text = "Hi \(displayName)"
        }

        if let photoUrl = user?.photoURL {
            userPictureView.kf.setImage(with: photoUrl)
            userPictureView.layer.cornerRadius = 75
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        refNavigationItem?.rightBarButtonItem = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = CustomUser.instance
        
        levelListView.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "test")
        levelListView.dataSource = self
        levelListView.delegate = self
        levelListView.tableFooterView = UIView()
        
        LevelManager.instance.getList(ofCurrentUser: true) { (err, levels) in
            self.levelData = levels
            self.levelListView.reloadData()
        }
    }

    @objc func logoutMenu() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        performSegue(withIdentifier: "detailViewFromUserPage", sender: levelData![indexPath.row])
    }
    
}
