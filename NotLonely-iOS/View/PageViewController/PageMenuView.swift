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
    var titleArray:Array<String> = []
    var delegate: PageMenuViewDelegate!
    let buttonwidth: CGFloat = 65
    let buttonalign: CGFloat = 15
    
    func setMenu(titleArray: Array<String>) {
        
//        margin = (width - (CGFloat(titleArray.count) * buttonwidth)) / CGFloat(titleArray.count + 1)
        margin = (width - (CGFloat(titleArray.count) * buttonwidth) - CGFloat(titleArray.count - 1) * buttonalign) / 2
        self.titleArray = titleArray
        for i in 0 ..< titleArray.count {
            let button = UIButton(type: .Custom)
            
            let buttonX = margin + CGFloat(i) * (buttonwidth + buttonalign)
            
            button.frame = CGRectMake(buttonX, 5, buttonwidth, 30)
            
            let title = titleArray[i]
            button.setTitle(title, forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.setTitleColor(UIColor.NLMainColor(), forState: .Normal)
            
            button.addTarget(self, action: #selector(buttonClick(_:)), forControlEvents: .TouchUpInside)
            buttonArray.append(button)
            self.addSubview(button)
        }
        
        lineView = UIView(frame: CGRectMake(margin, self.frame.height - 3, buttonwidth, 3))
        lineView?.backgroundColor = UIColor.NLMainColor()
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
        self.lineView?.frame.origin.x = button.frame.origin.x + (button.frame.width + 15) * pageRate
        selectIndex(Int(rate + 0.5))
    }
    
    func selectIndex(index: Int) {
        for button in buttonArray {
            button.setTitleColor(UIColor.NLMainColor(), forState: .Normal)
        }
        let button = buttonArray[index]
        button.setTitleColor(UIColor.NLMainColor(), forState: .Normal)
    }
    
}
