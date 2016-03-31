//
//  NNApi.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/13/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import SwiftyJSON

class NNApi {

    static let sharedInstance = NNApi()
    
    func TestApi(url : String, params : [String: AnyObject]?, completionHandler : (JSON?, AnyObject?) -> Void) {
        NNNetWork.sharedInstance.Get(url, params: params) { (json, sjson) -> Void in
            if (json != nil) {
                //这里加入解析数据json
                let tjson = JSON(json!)
                print("JSON: \(tjson)")
                completionHandler(tjson, nil)
            } else {
                completionHandler(nil, sjson)
            }
        }
    }
    
    
}
