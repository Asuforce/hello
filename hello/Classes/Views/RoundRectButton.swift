//
//  RoundRectButton.swift
//  hello
//
//  Created by usr0600439 on 2016/09/02.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

@IBDesignable
class RoundRectButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var buttonColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.backgroundColor = buttonColor
        }
    }
    
    @IBInspectable
    var textColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.setTitleColor(textColor, forState: UIControlState.Normal)
        }
    }
}