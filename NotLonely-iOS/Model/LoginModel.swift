//
//  LoginModel.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginModel {
    var msg: String
    var nickname: String?
    var sex: String?
    var introduction: String?
    var avatar: NSURL?
    
    init(json: JSON) {
        self.msg = json["msg"].stringValue
//        self.nickname = json["user"].["nickname"].stringValue
    }
}