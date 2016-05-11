//
//  UIViewController+Common.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/16/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import UIKit

import PKHUD

extension NLNetWork {
    func tipFromError(error: NSError) -> String {
        var tipStr = String()
        if error.userInfo["msg"] != nil {
            tipStr = error.userInfo["msg"] as! String
        } else {
            if ((error.userInfo["NSLocalizedDescription"]) == nil) {
                tipStr = String(error.userInfo["NSLocalizedDescription"]!)
            }else{
                tipStr = String("ErrorCode:" + String(error.code))
            }
        }
        
        return tipStr
    }
    
    func showHudTipStr(tipStr: String) {
        if tipStr.length > 0 {
            let view = UIApplication.sharedApplication().keyWindow!.rootViewController
            view!.noticeOnlyText(tipStr, autoClear: true, autoClearTime: 1)
        }
    }
}

extension NSObject {
    func horizontal_gradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.NLMainColor().CGColor, UIColor.NLMidColor().CGColor, UIColor.clearColor().CGColor];
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        return gradientLayer
    }
    
    func vertical_gradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.NLMainColor().CGColor, UIColor.NLMainColorAlpha(0.07).CGColor];
        gradientLayer.startPoint = CGPointMake(0.0, 0.95)
        gradientLayer.endPoint = CGPointMake(0.0, 0.0)
        return gradientLayer
    }
}