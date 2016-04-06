//
//  NLNavigationController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/5/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class NLNavigationController: UINavigationController {
    var animatedOnNavigationBar = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        guard let navigationController = navigationController else {
//            return
//        }
        
        self.navigationBar.barTintColor = UIColor.NLMainColor()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationBar.backgroundColor = nil
        self.navigationBar.translucent = true
        self.navigationBar.shadowImage = nil
        self.navigationBar.barStyle = UIBarStyle.Default
        self.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        
        self.navigationBar.tintColor = nil
        
        if self.navigationBarHidden {
            self.setNavigationBarHidden(false, animated: animatedOnNavigationBar)
        }
    }

}
