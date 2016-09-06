//
//  CalendarViewController.swift
//  hello
//
//  Created by usr0600439 on 2016/09/06.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var headerPrevBtn: UIButton!
    @IBOutlet weak var headerNextBtn: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedHeaderPrevBtn(sender: AnyObject) {
    }
    
    @IBAction func tappedHeaderNextBtn(sender: AnyObject) {
    }
}
