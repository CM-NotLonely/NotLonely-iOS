//
//  Implementations.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

import RxSwift
import SwiftyJSON

class DefaultValidationService: ValidationService {
    
    static let sharedValidation = DefaultValidationService()
    
    init() {
        print("test check")
    }
    
    func validateString(string: String) -> Bool {
        print("validateString")
        
        if string.length > 3 {
            return true
        } else {
            return false
        }
    }
    
}

class TestNetWorkApi : DefaultApi {
    static let sharedTestNetWorkApi = TestNetWorkApi()

    init() {
        print("test network")
    }
    
    func testNetwork(Params : [String: AnyObject]?) -> Observable<JSON?> {
        return Observable.create { (observer) -> Disposable in
            NLApi.sharedInstance.TestApi(LATEST_NEWS_URL, Params: nil, MethodType: NetWorkType.Get) { json, sjson in

                if json != nil {
                    print("not nil")
//                    print(tjson["date"].string)
                } else {
                    print("nil")
                }
                observer.on(.Next(json))
//                let data = json
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }

    }
}