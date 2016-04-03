//
//  NLTabBar.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/3/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class NLTabBar: UITabBar {

    lazy var publishBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ic_tabbar_publish"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "ic_tabbar_publish"), forState: UIControlState.Highlighted)
        
        self.addSubview(btn)
        
        return btn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.bounds.width / 5
        let height = self.bounds.height
        let frame = CGRectMake(0, 0, width, height)
        
        var index: CGFloat = 0
        for view in self.subviews {
            if (view is UIControl && !(view is UIButton)) {
                view.frame = CGRectOffset(frame, index * width, 0)
                index += (index == 1) ? 2 : 1
            }
        }
        
        self.publishBtn.frame = frame
        self.publishBtn.center = CGPointMake(self.bounds.width * 0.5, self.bounds.height * 0.5 )
    }
}
