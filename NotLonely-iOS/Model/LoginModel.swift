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
    var nickname: String?
    var sex: Bool?
    var introduction: String?
    var avatar: String?
    
    init(json: AnyObject) {
        let data = JSON(json)
        self.nickname = data["nickname"].stringValue
        self.sex = data["sex"].boolValue
        self.introduction = data["introduction"].stringValue
        self.avatar = data["avatar"].stringValue

//        self.nickname = json["user"].["nickname"].stringValue
    }
}