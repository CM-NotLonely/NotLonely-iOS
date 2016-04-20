//
//  PageViewController.swift
//  Apitest
//
//  Created by plusub on 4/17/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit



class PageViewController: UIViewController, UIScrollViewDelegate, PageMenuViewDelegate {
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    
    var titleArray: Array<String> = []
    var scrollView: UIScrollView!
    
    var viewArray: Array<UIViewController> = []
    
    var scrollY: CGFloat = 0
    var scrollX: CGFloat = 0

    var menuView: PageMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.view.setNeedsLayout()
        self.automaticallyAdjustsScrollViewInsets = true
        // Do any additional setup after loading the view.
        scrollViewLayout()
        menuViewLayout()
    }
    
    func scrollViewLayout() {
        self.scrollView = UIScrollView(frame: CGRectMake(0, navigationBarHeight + statusBarHeight + 44, width, height - (navigationBarHeight + statusBarHeight + 44)))
        
        self.scrollView.pagingEnabled = true
        self.scrollView.bounces = false
        self.scrollView.delegate = self
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.backgroundColor = UIColor.redColor()
        
        let contentWidth = CGFloat(titleArray.count)
        self.scrollView.contentSize = CGSizeMake(contentWidth * width, height - 230)
        
        scrollY = 0
        for i in 0 ..< viewArray.count {
//            let tableViewController = UITableViewController(style: .Plain)
//            if i == 0 {
//                tableViewController.view.backgroundColor = UIColor.greenColor()
//            } else if i == 1 {
//                tableViewController.view.backgroundColor = UIColor.yellowColor()
//            }
            
//            tableViewController.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
            viewArray[i].view.frame = CGRectMake(CGFloat(i) * width, -66, width, height - (navigationBarHeight + statusBarHeight + 44))
            
//            viewArray.append(viewArray[i])
            self.addChildViewController(viewArray[i])
            
            self.tabBarController!.view.setNeedsLayout()
            
            self.navigationController!.view.setNeedsLayout()
        }
        scrollView.addSubview(viewArray[0].view)
        self.view.addSubview(scrollView)
    }

    func menuViewLayout() {
        menuView = PageMenuView(frame: CGRectMake(0, navigationBarHeight + statusBarHeight, width, 44))
        menuView.backgroundColor = UIColor.NLMenu()
        menuView.delegate = self
        menuView.setMenu(titleArray)
        self.view.addSubview(self.menuView)
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
        
        for tableViewController in viewArray {
//            tableViewController.tableView.contentOffset = CGPointMake(0, scrollY)
        }
        
        let rate = (scrollView.contentOffset.x / width)
        self.menuView.scollToRate(rate)
        
        scrollView.addSubview(viewArray[Int(rate+0.7)].view)
        
        scrollX = scrollView.contentOffset.x
    }
}
