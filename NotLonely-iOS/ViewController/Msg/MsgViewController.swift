//
//  MsgViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController {
//    @IBOutlet weak var pageVC: PageViewController! {
//        didSet {
//
//        }
//    }
    var frame = CGRectMake(0, 0, 0, 0)

    @IBOutlet weak var contentView: UIView!
    
    lazy var inviteinfVC: InviteInfViewController? = {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("InviteInfViewController") as! InviteInfViewController
        return vc
    }()
    
    lazy var myfollowVC: MyFollowViewController? = {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("MyFollowViewController") as! MyFollowViewController
        return vc
    }()
    
    lazy var likeVC: LikeViewController? = {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("LikeViewController") as! LikeViewController
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inviteinfVC!.title = "动态"
        myfollowVC!.title = "问题"
        likeVC!.title = "讨论"
//
        self.tabBarController!.view.setNeedsLayout()

        let vcArray = [inviteinfVC!, myfollowVC!, likeVC!]
//        let zeVC = PageViewController()
//        zeVC.titleArray = ["动态","问题","讨论"]
//        self.addChildViewController(zeVC)
//        zeVC.didMoveToParentViewController(self)
//        zeVC.view.frame = self.contentView.bounds
//        frame = self.contentView.bounds
//        self.contentView.addSubview(zeVC.view)
//        self.tabBarController!.view.setNeedsLayout()
//        self.navigationController!.view.setNeedsLayout()
//        self.currentViewController = zeVC
        
        let zeVC = PageViewController()
        zeVC.titleArray = ["@我","我关注的","点赞"]
        zeVC.viewArray = vcArray
        self.addChildViewController(zeVC)
        self.view.addSubview(zeVC.view)

//        self.addChildViewController(zeVC)
//        self.view.addSubview(zeVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
