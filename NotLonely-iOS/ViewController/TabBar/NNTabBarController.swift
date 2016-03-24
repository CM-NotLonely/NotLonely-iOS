//
//  NNTabBarController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/23/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class NNTabBarController: UITabBarController {
    @IBOutlet weak var mainTabBar: NNTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewController()
        mainTabBar.publishBtn.addTarget(self, action: #selector(publishPresent), forControlEvents: .TouchUpInside)
        
        
    }
    
    func publishPresent() {
        print("adf")
        let storyboard = UIStoryboard(name: "Publish", bundle: nil)
        let publishVC : PublishViewController = storyboard.instantiateViewControllerWithIdentifier("PublishViewController") as! PublishViewController
        self.presentViewController(publishVC, animated: true, completion: nil)
    }
    
    
    func addViewController() {
        addChildViewController("Home", imageName: "ic_tabbar_home", hightlight: "ic_tabbar_home_select")
        addChildViewController("Find", imageName: "ic_tabbar_find", hightlight: "ic_tabbar_find_select")
        addChildViewController("Msg", imageName: "ic_tabbar_message", hightlight: "ic_tabbar_message_select")
        addChildViewController("My", imageName: "ic_tabbar_my", hightlight: "ic_tabbar_my_select")
    }
    
    func addChildViewController(name: String, imageName: String, hightlight: String){
        let navigation = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController() as! NNNavigationController
        
        navigation.tabBarItem.image = UIImage(named: imageName)
        navigation.tabBarItem.selectedImage = UIImage(named: hightlight)?.imageWithRenderingMode(.AlwaysOriginal)
        navigation.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        navigation.title = nil
        
        self.addChildViewController(navigation)
        
    }
}
