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

    func NetWork(Url : String, Params : [String: AnyObject]?, MethodType : NetWorkType, completionHandler : (NSDictionary?, AnyObject?) -> Void) {

        let httpUrl = BASE_URL + Url
        
        switch MethodType {
        case NetWorkType.Get:
            Alamofire.request(.GET, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    print(totalBytesRead)
                }
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
        case NetWorkType.Post:
            Alamofire.request(.POST, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    print(totalBytesRead)
                }
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
        case NetWorkType.Patch:
            Alamofire.request(.PATCH, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    print(totalBytesRead)
                }
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
        case NetWorkType.Delete:
            Alamofire.request(.DELETE, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    print(totalBytesRead)
                }
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
    }
    
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
