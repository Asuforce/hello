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
        
        tableView.registerNib(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myTableCell")
        
        Friend.fetchFriends() { friends in
            self.friends = friends
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("myTableCell", forIndexPath: indexPath) as! MyTableViewCell
        
        updateCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    private func updateCell(cell: MyTableViewCell, indexPath: NSIndexPath) {
        let name = self.friends[indexPath.row].name
        let URL = NSURL(string: self.friends[indexPath.row].image_url)!
        let placeholderImage = UIImage(named: name)
        
        cell.nameLabel?.text = name
        cell.levelLabel?.text = "Lv.\(self.friends[indexPath.row].level)"
        cell.faceImageView?.af_setImageWithURL(
            URL,
            placeholderImage: placeholderImage,
            imageTransition: .CurlDown(0.2)
        )
    }
}