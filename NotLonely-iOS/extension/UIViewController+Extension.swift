//
//  UIViewController+Extension.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/3/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
    }
    
    var descriptiveName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue as NSString?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
    }
    
    // MARK: - Method Swizzling
    
    func nsh_viewWillAppear(animated: Bool) {
        self.nsh_viewWillAppear(animated)
        let test = self.restorationIdentifier
        println(test)
        if let name = self.descriptiveName {
            println("viewWillAppear: \(name)")
        } else {
            println("viewWillAppear: \(self)")
        }
    }
    
    public var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.height
            }
            return 0
        }
    }
    
    func showHudTipStr(tipStr: String) {
        if tipStr.length > 0 {
            let view = UIApplication.sharedApplication().keyWindow!.rootViewController
            view!.noticeOnlyText(tipStr, autoClear: true, autoClearTime: 1)
        }
    }
}