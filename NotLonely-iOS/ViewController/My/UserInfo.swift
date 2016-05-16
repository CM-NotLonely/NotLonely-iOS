//
//  UserInfo.swift
//  NotLonely-iOS
//
//  Created by efan on 5/16/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa

class UserInfo:NSObject{
    
    static let sharedInstance = UserInfo()
    private init() {}
    
    let usernameText = Observable<String>()
    let userIntro = Observable<String>()
    let focusNumber = Observable<Int>()
    let sex = Observable<String>()
    
    
}