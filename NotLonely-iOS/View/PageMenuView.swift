//
//  PageMenuView.swift
//  Apitest
//
//  Created by plusub on 4/17/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

let width = UIScreen.mainScreen().bounds.size.width
let height = UIScreen.mainScreen().bounds.size.height


protocol PageMenuViewDelegate {
    func selectIndex(index: Int)
}

class PageMenuView: UIView {
    
    var lineView:UIView?
    var margin: CGFloat!
    var buttonArray:Array<UIButton> = []
    var titleArray:Array<UIViewController> = []
    var delegate: PageMenuViewDelegate!
    
    func setMenu(titleArray: Array<UIViewController>) {
        
        margin = (width - (CGFloat(titleArray.count) * 75)) / CGFloat(titleArray.count + 1)
        self.titleArray = titleArray
        for i in 0 ..< titleArray.count {
            let button = UIButton(type: .Custom)
            let buttonX = margin * (CGFloat(i) + 1) + CGFloat(i) * 75
            
            button.frame = CGRectMake(buttonX, 0, 75, 40)
            
            let title = titleArray[i]
            button.setTitle(title.title, forState: .Normal)
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
            button.addTarget(self, action: #selector(buttonClick(_:)), forControlEvents: .TouchUpInside)
            buttonArray.append(button)
            self.addSubview(button)
        }
        
        lineView = UIView(frame: CGRectMake(margin, self.frame.height - 1, 75, 2))
        lineView?.backgroundColor = UIColor.blackColor()
        self.addSubview(lineView!)
    }
    
    func buttonClick(button: UIButton) {
        let index = buttonArray.indexOf(button)
        selectIndex(index!)
        delegate.selectIndex(index!)
        UIView.animateWithDuration(0.3) {
            self.scollToRate(CGFloat(index!))
        }
    }
    
    func scollToRate(rate: CGFloat) {
        if Int(rate) >= titleArray.count {
            return
        }
        let index = Int(rate)
        let pageRate = rate - CGFloat(index)
        let button = self.buttonArray[index]
        self.lineView?.frame.origin.x = button.frame.origin.x + (button.frame.width+margin) * pageRate
        selectIndex(Int(rate + 0.5))
    }
    
    func selectIndex(index: Int) {
        for button in buttonArray {
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        }
        let button = buttonArray[index]
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
    
}
