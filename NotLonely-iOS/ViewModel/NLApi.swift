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
                let tjson = JSON(json!)
                println("JSON: \(tjson)")
                completionHandler(tjson, nil)
            } else {
                completionHandler(nil, sjson)
            }
        })
    }
    
    
    //注册
    func RegisterApi(Params : [String: AnyObject]?, MethodType: NetWorkType, completionHandler : (RegisterModel?, AnyObject?) -> Void) {
        NLNetWork.sharedInstance.NetWork("register", Params: Params, MethodType: MethodType, completionHandler: {json, sjson in
            if json != nil {
                let tjson = RegisterModel(json: json!)
                self.UserData(Params!)
                println("---------- json to \(tjson) is success... ----------")
                completionHandler(tjson, nil)
            } else {
                println("---------- json is nil... ----------")
                completionHandler(nil, sjson)
            }
        })
    }
    
    //登陆
    func LoginApi(Params : [String: AnyObject]?, MethodType: NetWorkType, completionHandler : (LoginModel?, AnyObject?) -> Void) {
        NLNetWork.sharedInstance.NetWork("login", Params: Params, MethodType: MethodType, completionHandler: {json, sjson in
            if json != nil {
                let tjson = LoginModel(json: json!)
                self.UserData(Params!)
                println("---------- json to \(tjson) is success... ----------")
                completionHandler(tjson, nil)
            } else {
                println("---------- json is nil... ----------")
                completionHandler(nil, sjson)
            }
        })
    }
}
