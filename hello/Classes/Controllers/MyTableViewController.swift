//
//  MyTableViewController.swift
//  hello
//
//  Created by usr0600439 on 2016/09/05.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit
import AlamofireImage

class MyTableViewController: UITableViewController {
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myTableCell")
        
        Friend.fetchFriends() { friends in
            self.friends = friends
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! MyTableViewCell
        
        updateCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    fileprivate func updateCell(_ cell: MyTableViewCell, indexPath: IndexPath) {
        let name = self.friends[(indexPath as NSIndexPath).row].name
        let URL = Foundation.URL(string: self.friends[(indexPath as NSIndexPath).row].image_url)!
        let placeholderImage = UIImage(named: name)
        
        cell.nameLabel?.text = name
        cell.levelLabel?.text = "Lv.\(self.friends[(indexPath as NSIndexPath).row].level)"
        cell.faceImageView?.af_setImage(
            withURL: URL,
            placeholderImage: placeholderImage,
            imageTransition: .crossDissolve(0.2)
        )
    }
}
