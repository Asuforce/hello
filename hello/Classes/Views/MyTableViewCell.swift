//
//  MyTableViewCell.swift
//  hello
//
//  Created by usr0600439 on 2016/09/05.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lebelLabel: UILabel!
    @IBOutlet weak var faceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
