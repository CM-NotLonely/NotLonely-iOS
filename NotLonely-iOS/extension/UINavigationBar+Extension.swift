//
//  UINavigationBar+Extension.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/4/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
//    private struct AssociatedKeys {
//        static var DescriptiveName = "nsh_DescriptiveName"
//    }
//    
//    var descriptiveName: String? {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
//        }
//        
//        set {
//            if let newValue = newValue {
//                objc_setAssociatedObject(
//                    self,
//                    &AssociatedKeys.DescriptiveName,
//                    newValue as NSString?,
//                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
//                )
//            }
//        }
//    }
    
    private struct OverLayKeys {
        static var overlayKey : UIView?
    }
    
    var overlay: UIView! {
        get {
            return objc_getAssociatedObject(self, &OverLayKeys.overlayKey) as? UIView
        }
        set {
            return objc_setAssociatedObject(self, &OverLayKeys.overlayKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func nl_setBackgroundColor(backgroundColor: UIColor) {
        if (self.overlay == nil) {
            self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            
            self.overlay = UIView(frame: CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20))
            self.overlay.userInteractionEnabled = false
            self.overlay.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.insertSubview(self.overlay, atIndex: 0)
        }
        self.overlay.backgroundColor = backgroundColor
    }
    
    func nl_setTranslationY(translationY: CGFloat) {
        self.transform = CGAffineTransformMakeTranslation(0, translationY)
    }
    
    func nl_setElementsAlpha(alpha: CGFloat) {
        (self.valueForKey("_leftViews") as? NSArray)!.enumerateObjectsUsingBlock({ (view, int, stop) in
            (view as! UIView).alpha = alpha
        })
        (self.valueForKey("_rightViews") as? NSArray)!.enumerateObjectsUsingBlock({ (view, int, stop) in
            (view as! UIView).alpha = alpha
        })
        
        let titleView = self.valueForKey("_titleView") as! UIView
        titleView.alpha = alpha
        
        (self.subviews as NSArray).enumerateObjectsUsingBlock(){ view, int, stop in
            if view .isKindOfClass(NSClassFromString("UINavigationItemView")!) {
                (view as! UIView).alpha = alpha
                stop.memory = true
            }
        }
    }
    
    func nl_reset() {
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.overlay.removeFromSuperview()
        self.overlay = nil
    }
    
}