//
//  PageViewController.swift
//  Apitest
//
//  Created by plusub on 4/17/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit



class PageViewController: UIView, UIScrollViewDelegate, PageMenuViewDelegate {
    
    var titleArray: Array<UIViewController> = []
    var scrollView: UIScrollView!
    
    var viewArray: Array<UIViewController> = []
    
    var scrollY: CGFloat = 0
    var scrollX: CGFloat = 0

    var menuView: PageMenuView!
    
//    init(frame: CGRect, titleArray: Array<UIViewController>) {
//        super.init(frame: frame)
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setProperty(titleArray: Array<UIViewController>) {
        self.titleArray = titleArray
        scrollViewLayout()
        menuViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setNeedsLayout()
    }
    
    func scrollViewLayout() {
        scrollView = UIScrollView(frame: CGRectMake(0, 0, self.width, self.height))
        
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        
        let contentWidth = CGFloat(titleArray.count)
        scrollView.contentSize = CGSizeMake(contentWidth * width, height)
        
        scrollY = 0
        for i in 0 ..< titleArray.count {
            let tableViewController = UITableViewController(style: .Plain)
            if i == 0 {
                tableViewController.view.backgroundColor = UIColor.greenColor()
            } else if i == 1 {
                tableViewController.view.backgroundColor = UIColor.yellowColor()
            }
            
            tableViewController.tableView.contentInset = UIEdgeInsetsMake(75, 0, 0, 0)
            tableViewController.view.frame = CGRectMake(CGFloat(i) * width, 0, width, height)
            
            viewArray.append(tableViewController)
            self.addSubview(tableViewController.view)
        }
        scrollView.addSubview(viewArray[0].view)
        self.addSubview(scrollView)
    }

    func menuViewLayout() {
        menuView = PageMenuView(frame: CGRectMake(0, 0, width, 44))
        menuView.delegate = self
        menuView.setMenu(titleArray)
        self.addSubview(self.menuView)
    }
    
    func selectIndex(index: Int) {
        UIView.animateWithDuration(0.3) {
            self.scrollView?.contentOffset = CGPointMake(self.width * CGFloat(index), -64)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollX == scrollView.contentOffset.x{
            return;
        }

        if scrollY >= -104 {
            scrollY = -104
        }
        
        let rate = (scrollView.contentOffset.x / width)
        self.menuView.scollToRate(rate)
        
        scrollView.addSubview(viewArray[Int(rate+0.7)].view)
        
        scrollX = scrollView.contentOffset.x
    }
}
