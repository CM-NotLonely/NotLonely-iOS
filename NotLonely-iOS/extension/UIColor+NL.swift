//
//  UIColor+NL.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/3/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func NLMainColor() -> UIColor {
        return UIColor(red:1, green:0.69, blue:0.1, alpha:1)
    }
    
    class func NLMainColorAlpha(alpha: CGFloat) -> UIColor {
        return UIColor(red:1, green:0.69, blue:0.1, alpha:alpha)
    }
    
    class func NLMidColor() -> UIColor {
        return UIColor(red:1, green:0.69, blue:0.1, alpha:0.1)
    }
    
    class func NLInputTextFieldLine() -> UIColor {
//        return UIColor(red:0.71, green:0.68, blue:0.67, alpha:1)
        return UIColor.init(white: 1, alpha: 0.3)
    }
    
    
    class func NLPublishTextField() -> UIColor {
        return UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
    }
    
    class func NLMenu() -> UIColor {
        return UIColor(red:0.98, green:0.98, blue:0.98, alpha:1)
    }
}
