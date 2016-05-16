//
//  MyTableViewCell.swift
//  NotLonely-iOS
//
//  Created by 胡胡赛军 on 5/16/16.
//  Copyright © 2016 cm. All rights reserved.
//

//import Cocoa
import UIKit


class MyTableViewCell: UITableViewCell {


    @IBOutlet weak var leadingLabel: UILabel!
    @IBOutlet weak var trailingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trailingLabel.sizeToFit()
        leadingLabel.sizeToFit()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
