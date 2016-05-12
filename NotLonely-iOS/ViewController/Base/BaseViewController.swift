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
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.NLBackgroundColor()
    }

}
