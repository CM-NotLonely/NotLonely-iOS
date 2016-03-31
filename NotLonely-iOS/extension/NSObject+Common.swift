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

extension NNNetWork {
    func tipFromError(error: NSError) -> String {
        var tipStr = String()
        if error.userInfo["date"] != nil {
            print("123")
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
            HUD.dimsBackground = false
            HUD.allowsInteraction = false
            HUD.flash(.Label(tipStr), delay: 1.0)
        }
    }

}