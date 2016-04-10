//
//  InterestPeopleCell.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/10/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class InterestPeopleCell: UITableViewCell {
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var headImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followNumLabel: UILabel!
    @IBOutlet weak var briefLabel: UILabel!
    @IBOutlet weak var followBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headImg.image = UIImage(named: "head.png")
        backImg.image = UIImage(named: "back1.png")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
