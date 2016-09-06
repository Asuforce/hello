//
//  CalendarCell.swift
//  hello
//
//  Created by usr0600439 on 2016/09/06.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        textLabel = UILabel(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}