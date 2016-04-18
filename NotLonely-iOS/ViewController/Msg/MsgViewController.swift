//
//  MsgViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController {
    @IBOutlet weak var pageVC: PageViewController! {
        didSet {
            inviteinfVC!.title = "动态"
            myfollowVC!.title = "问题"
            likeVC!.title = "讨论"
            
            let vcArray = [inviteinfVC!, myfollowVC!, likeVC!]
            pageVC.setProperty(vcArray)
        }
    }
    
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

        
//        pageVC = PageViewController.init(frame: CGRectMake(0, (self.navigationController?.navigationBar.height)! + 22, self.view.width, self.view.height), titleArray: vcArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
