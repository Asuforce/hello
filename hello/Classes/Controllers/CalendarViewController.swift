//
//  CalendarViewController.swift
//  hello
//
//  Created by usr0600439 on 2016/09/06.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }

    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let dateManager = DateManager()
    let daysPerweek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = NSData()
    var today: NSDate!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @IBOutlet weak var headerPrevBtn: UIButton!
    @IBOutlet weak var headerNextBtn: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calendarCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.backgroundColor = UIColor.whiteColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition()
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CalendarCell

        return cell
    }

    @IBAction func tappedHeaderPrevBtn(sender: AnyObject) {
    }

    @IBAction func tappedHeaderNextBtn(sender: AnyObject) {
    }
}
