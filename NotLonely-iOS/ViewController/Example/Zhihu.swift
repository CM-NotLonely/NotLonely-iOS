//
//  Zhihu.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/31/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ZhihuModel {
    var date: String
    var stories:JSON = [:]
    
    init(json: JSON) {
//        let data = JSON(json)
        self.date = json["date"].stringValue
        self.stories = json["stories"]
    }
}
