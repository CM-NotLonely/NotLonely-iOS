//
//  BaseViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/23/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class BaseViewController: SegueViewController {
    var animatedOnNavigationBar = true
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navigationController = navigationController else {
            return
        }
        
        navigationController.navigationBar.barTintColor = UIColor.init(red:1, green:0.7, blue:0, alpha:1)
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        navigationController.navigationBar.backgroundColor = nil
        navigationController.navigationBar.translucent = true
        navigationController.navigationBar.shadowImage = nil
        navigationController.navigationBar.barStyle = UIBarStyle.Default
        navigationController.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        
        navigationController.navigationBar.tintColor = nil
        
        if navigationController.navigationBarHidden {
            navigationController.setNavigationBarHidden(false, animated: animatedOnNavigationBar)
        }
    }
}
