//
//  AppDelegate.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/10/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import ReachabilitySwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        NetworkActivityIndicatorManager.sharedManager.isEnabled = true

        startLogin()
//        startTabBar()
        return true
    }

    func startLogin() {
        
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let rootViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        window?.rootViewController = rootViewController
    }
    
    func startTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewControllerWithIdentifier("NLTabBarController") as! NLTabBarController
        window?.rootViewController = rootViewController
    }
    
}

