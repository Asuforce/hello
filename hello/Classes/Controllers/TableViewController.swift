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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hoges.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("hogeCell", forIndexPath: indexPath)

        updateCell(cell, indexPath: indexPath)

        return cell
    }

    private func updateCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        cell.textLabel?.text = self.hoges[indexPath.row].content
    }
}