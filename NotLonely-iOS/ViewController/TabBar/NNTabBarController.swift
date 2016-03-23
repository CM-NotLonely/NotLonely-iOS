//
//  NNTabBarController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/23/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class NNTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Titles
        
        if let items = tabBar.items {
            for i in 0..<items.count {
                let item = items[i]
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            }
        }
    
    }
}
