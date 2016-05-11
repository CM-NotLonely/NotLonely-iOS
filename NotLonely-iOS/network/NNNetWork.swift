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

enum NetWorkType {
    case Get
    case Post
    case Patch
    case Delete
}

class NLNetWork  {
    static let sharedInstance = NLNetWork()
    
    init() {
        println("test")
        
    }
    
    
    
    let NLBaseURL : String = "http://192.168.1.147/"

    func NetWork(Url : String, Params : [String: AnyObject]?, MethodType : NetWorkType, completionHandler : (NSDictionary?, AnyObject?) -> Void) {
        
        let httpUrl = NLBaseURL + Url
        println("\n---------- Url is  ----------")
        println(httpUrl)
        println("---------- Params is  ----------")
        println(Params)
        
        switch MethodType {
        case NetWorkType.Get:
            Alamofire.request(.GET, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    println("---------- totalBytesRead is \(totalBytesRead) ----------")
                }
                .responseJSON{ response in
                    switch response.result {
                    case .Success(let value):
                        let jsonDic = value as! NSDictionary
                        
                        println("---------- json start ----------")
                        println(jsonDic)
                        println("---------- json end ----------")
                        
                        println("---------- json start ----------")
                        println(jsonDic)
                        println("---------- json end ----------")
                        
                        let error = self.handleReponse(jsonDic)
                        if (error == nil) {
                            println("---------- network is ok data is ok ----------")
                            completionHandler(jsonDic, nil)
                        } else {
                            println("---------- network is ok data is error ----------")
                            completionHandler(nil, error)
                        }
                    case .Failure(let error):
                        println("---------- network is failure ----------")
                        self.showError(error)
                    }
            }
        case NetWorkType.Post:
            Alamofire.request(.POST, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    println("---------- totalBytesRead is \(totalBytesRead) ----------")
                }
                .responseJSON{ response in
                    switch response.result {
                    case .Success(let value):
                        let jsonDic = value as! NSDictionary
                        
                        println("---------- json start ----------")
                        println(jsonDic)

                        let error = self.handleReponse(jsonDic)
                        if (error == nil) {
                            println("---------- network is ok data is ok ----------\n")
                            completionHandler(jsonDic, nil)
                        } else {
                            println("---------- network is ok data is error ----------\n")
                            completionHandler(nil, error)
                        }
                    case .Failure(let error):
                        println("---------- network is failure ----------\n")
                        self.showError(error)
                    }
            }
        case NetWorkType.Patch:
            Alamofire.request(.PATCH, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    println("---------- totalBytesRead is \(totalBytesRead) ----------")
                }
                .responseJSON{ response in
                    switch response.result {
                    case .Success(let value):
                        let jsonDic = value as! NSDictionary
                        
                        println("---------- json start ----------")
                        println(jsonDic)
                        println("---------- json end ----------")
                        
                        let error = self.handleReponse(jsonDic)
                        if (error == nil) {
                            println("---------- network is ok data is ok ----------")
                            completionHandler(jsonDic, nil)
                        } else {
                            println("---------- network is ok data is error ----------")
                            completionHandler(nil, error)
                        }
                    case .Failure(let error):
                        println("---------- network is failure ----------")
                        self.showError(error)
                    }
            }
        case NetWorkType.Delete:
            Alamofire.request(.DELETE, httpUrl, parameters: Params, encoding: .JSON, headers: nil)
                .progress{ bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    println(totalBytesRead)
                }
                .responseJSON{ response in
                    switch response.result {
                    case .Success(let value):
                        let jsonDic = value as! NSDictionary
                        
                        println("---------- json start ----------")
                        println(jsonDic)
                        println("---------- json end ----------")
                        
                        let error = self.handleReponse(jsonDic)
                        if (error == nil) {
                            println("---------- network is ok data is ok ----------")
                            completionHandler(jsonDic, nil)
                        } else {
                            println("---------- network is ok data is error ----------")
                            completionHandler(nil, error)
                        }
                    case .Failure(let error):
                        println("---------- network is failure ----------")
                        self.showError(error)
                    }
            }
        }
    }
    
    func handleReponse(responseJson : NSDictionary) -> NSError? {
        var error : NSError?
        let resultCode : Int
        
        resultCode = (responseJson["code"]?.integerValue)!
        if resultCode != 0 {
            if resultCode == 20160322 {
                showHudTipStr("您已经评论过啦~")
            } else {
                error = NSError(domain: BASE_URL, code: resultCode, userInfo: responseJson as [NSObject : AnyObject])
                showError(error!)
            }
        }
        
        return error
    }
    
    func showError(error: NSError) {
        if error.code == NSURLErrorTimedOut {
            showHudTipStr("服务器开了个小差")
        } else {
            showHudTipStr(tipFromError(error))
        }
        
    }
    
}
