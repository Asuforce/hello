//
//  TableViewController.swift
//  hello
//
//  Created by usr0600439 on 2016/09/02.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var hoges = [Hoge]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hoge.fetchHoges() { hoges in
            self.hoges = hoges
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hoges.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "hogeCell", for: indexPath)
        
        updateCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    fileprivate func updateCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = self.hoges[(indexPath as NSIndexPath).row].content
    }
}
