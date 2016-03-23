//
//  SegueViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/23/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {

    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        
        if let navigationController = navigationController {
            guard navigationController.topViewController == self else {
                return
            }
        }
        
        super.performSegueWithIdentifier(identifier, sender: sender)
    }
    
}
