//
//  NNApi.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/13/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import SwiftyJSON

class NLApi {

    static let sharedInstance = NLApi()

    func TestApi(Url : String, Params : [String: AnyObject]?, MethodType: NetWorkType, completionHandler : (JSON?, AnyObject?) -> Void) {
        NLNetWork.sharedInstance.NetWork(Url, Params: Params, MethodType: MethodType, completionHandler: {json, sjson in
            if json != nil {
                //这里加入解析数据json
                let tjson = JSON(json!)
                print("JSON: \(tjson)")
                completionHandler(tjson, nil)
            } else {
                completionHandler(nil, sjson)
            }
        })
    }
    
    func LoginApi(Url : String, Params : [String: AnyObject]?, MethodType: NetWorkType, completionHandler : (JSON?, AnyObject?) -> Void) {
        NLNetWork.sharedInstance.NetWork(Url, Params: Params, MethodType: MethodType, completionHandler: {json, sjson in
            if json != nil {
                //这里加入解析数据json
                let tjson = JSON(json!)
                print("JSON: \(tjson)")
                completionHandler(tjson, nil)
            } else {
                completionHandler(nil, sjson)
            }
        })
    }
    
//        Get(url, params: params) { (json, sjson) -> Void in
//            if (json != nil) {
//                //这里加入解析数据json
//                let tjson = JSON(json!)
//                print("JSON: \(tjson)")
//                completionHandler(tjson, nil)
//            } else {
//                completionHandler(nil, sjson)
//            }
//        }
//    }
    
    
}
