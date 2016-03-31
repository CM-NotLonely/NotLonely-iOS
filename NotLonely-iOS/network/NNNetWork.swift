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

enum NetWorkType {
    case Get
    case Post
    case Patch
    case Delete
}

class NNNetWork  {
    static let sharedInstance = NNNetWork()

    //get请求
    func Get(url : String, params : [String: AnyObject]?, completionHandler : (NSDictionary?, AnyObject?) -> Void) {
        let httpUrl : String = BASE_URL + LATEST_NEWS_URL
//        let httpUrl1 : String = BASE_URL
//        let test : String = local
        
        Alamofire.request(.GET, httpUrl, parameters: nil, encoding: .JSON, headers: nil)
            .progress{bytesRead, totalBytesRead, totalBytesExpectedToRead in
                print(totalBytesRead)}
            .responseJSON{ response in
            
                switch response.result {
                case .Success(let value):
                    let jsonDic = value as! NSDictionary
                    
                    print(jsonDic)
                    let error = self.handleReponse(jsonDic)
                    
                    if (error == nil) {
                        print("success")
                        completionHandler(jsonDic, nil)
                    } else {
                        print("fail")
                        completionHandler(nil, error)
                    }
                case .Failure(let error):
                    self.showError(error)
                }
        }
    }
    
//    //post请求
//    static func Post(url : String, params : [String: AnyObject]?, success : (json: AnyObject) -> Void, fail : (error: Any) -> Void) {
//        let httpUrl : String = BASE_URL + LATEST_NEWS_URL
//        let httpUrl1 : String = BASE_URL
//        
//        let request = Alamofire.request(.GET, httpUrl)
//        print(request)
//        
//        Alamofire.request(.POST, httpUrl1, parameters: nil, encoding: .JSON, headers: nil).responseJSON { (response) -> Void in
//            switch response.result {
//            case .Success(let value):
//                success(json: value)
//            case .Failure(let error):
//                fail(error: error)
//            }
//        }
//    }
    
    func handleReponse(responseJson : NSDictionary) -> NSError? {
        var error : NSError?
        let resultCode : Int
        
        resultCode = (responseJson["date"]?.integerValue)!
        if resultCode != 1 {
            if resultCode == 20160322 {
                showHudTipStr("您已经评论过啦~")
            } else {
                error = NSError.init(domain: BASE_URL, code: resultCode, userInfo: responseJson as [NSObject : AnyObject])
                showError(error!)
            }
            
        }
        
        return error
    }
    
    func showError(error: NSError) {
        if error.code == NSURLErrorTimedOut {
            HUD.flash(.Label("Requesting Licence…"), delay: 1.0) { _ in
                print("License Obtained.")
            }
        } else {
            showHudTipStr(tipFromError(error))
        }
        
    }
    
}
