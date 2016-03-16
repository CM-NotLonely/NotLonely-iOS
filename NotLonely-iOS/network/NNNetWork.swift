//
//  NNNetWork.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/13/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import Alamofire
import PKHUD

//let NETWORK_TIMEOUT: NSTimeInterval = 15

class NNNetWork : NSObject {
    
    //get请求
    static func Get(url : String, params : [String: AnyObject]?, success : (NSDictionary, String?) -> Void, fail : (error: Any) -> Void) {
        let httpUrl : String = BASE_URL + LATEST_NEWS_URL
//        let httpUrl1 : String = BASE_URL
        let test : String = local

        let request = Alamofire.request(.GET, testurl)
        print(request)


        Alamofire.request(.GET, test, parameters: nil, encoding: .JSON, headers: nil)
            .progress({ (bytesRead, totalBytesRead, totalBytesExpectedToRead) -> Void in
                print(totalBytesRead)
            })
            .responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let value):
                let jsonDic = value as! NSDictionary
                
                print(jsonDic)
                handleReponse(jsonDic)
                
                if (jsonDic["date"]?.integerValue == 20160316) {
                    print("success")
                    success(jsonDic, nil)
                } else {
                    print("fail")
                    success(jsonDic, nil)
                }
            case .Failure(let error):
                showError(error)
                fail(error: error)
            }
        }
    }
    
    //post请求
    static func Post(url : String, params : [String: AnyObject]?, success : (json: AnyObject) -> Void, fail : (error: Any) -> Void) {
        let httpUrl : String = BASE_URL + LATEST_NEWS_URL
        let httpUrl1 : String = BASE_URL
        
        let request = Alamofire.request(.GET, httpUrl)
        print(request)
        
        Alamofire.request(.POST, httpUrl1, parameters: nil, encoding: .JSON, headers: nil).responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let value):
                success(json: value)
            case .Failure(let error):
                fail(error: error)
            }
        }
    }
    
    static func handleReponse(responseJson : NSDictionary) -> NSError{
        var error : NSError?
        let resultCode : Int
        
        resultCode = (responseJson["date"]?.integerValue)!
        if resultCode != 1 {
            if resultCode == 3001 {
                print("后台错误")
            } else {
                error = NSError.init(domain: BASE_URL, code: resultCode, userInfo: responseJson as [NSObject : AnyObject])
                showError(error!)
            }
            
        }
        
        return error!
    }
    
    static func showError(error: NSError) {
        if error.code == NSURLErrorTimedOut {
            HUD.flash(.Label("Requesting Licence…"), delay: 1.0) { _ in
                print("License Obtained.")
            }
        } else {
            showHudTipStr(tipFromError(error))
        }
            

    }
    
}
