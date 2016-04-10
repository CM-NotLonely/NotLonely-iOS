//
//  HomeViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    enum TabIndex : Int {
        case FirstChildTab = 0
        case SecondChildTab = 1
    }
    
    var i = 0
    var frame = CGRectMake(0, 0, 0, 0)

    @IBOutlet weak var contentView: UIView!
    var currentViewController: UIViewController?

    lazy var activityVC: ActivityViewController? = {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ActivityViewController") as! ActivityViewController
        return vc
    }()
    
    lazy var circleVC: CircleViewController? = {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("CircleViewController") as! CircleViewController
        return vc
    }()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func switchTabs(sender: AnyObject) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentedControl.selectedSegmentIndex = TabIndex.FirstChildTab.rawValue
        displayCurrentTab(TabIndex.FirstChildTab.rawValue)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func displayCurrentTab(tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)
            
            
//            if i == 0 {
                vc.view.frame = self.contentView.bounds
                frame = self.contentView.bounds
//                i = i + 1
//            } else {
//                vc.view.frame = frame
//            }
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.FirstChildTab.rawValue :
            vc = activityVC
        case TabIndex.SecondChildTab.rawValue :
            vc = circleVC
        default:
            return nil
        }
        
        return vc
    }

}
