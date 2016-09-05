//
//  ViewController.swift
//  hello
//
//  Created by usr0600439 on 2016/09/01.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func increaseButtonTapped(sender: AnyObject) {
        self.counter.countUp()
        countLabel.text = String(self.counter.current())
    }
    
    @IBAction func decreaseButtonTapped(sender: AnyObject) {
        self.counter.countDown()
        countLabel.text = String(self.counter.current())
    }
    
    var counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countLabel.text = String(self.counter.current())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}