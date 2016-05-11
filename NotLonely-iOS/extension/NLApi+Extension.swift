//
//  NLApi+Extension.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/11/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

extension NLApi {
    func UserData(Params: [String: AnyObject]) {
        Defaults[.username] = Params["username"] as? String
        Defaults[.password] = Params["password"] as? String
    }
}