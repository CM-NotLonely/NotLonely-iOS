//
//  RegisterModel.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/9/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

class RegisterModel {
    var msg: String
    
    init(json: AnyObject) {
        let data = JSON(json)
        self.msg = data["msg"].stringValue
    }
}