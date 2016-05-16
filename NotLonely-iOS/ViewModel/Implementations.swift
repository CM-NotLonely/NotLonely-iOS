//
//  Implementations.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

class NLValidationService: ValidationService {
    
    static let sharedValidation = NLValidationService()
    
    init() {
        println("NLValidationService")
    }
    
    func validateString(string: String) -> Bool {
        if string.length > 3 {
            return true
        } else {
            return false
        }
    }
    
    
    func validateSameString(password: String, repeatedPassword: String) -> Bool {
        if repeatedPassword == password{
            return true
        } else {
            return false
        }
    }
    
    func validateStringEmpty(string: String) -> Bool {
        if string.length > 0 {
            return true
        } else {
            return false
        }
    }

}

class VMNetWorkApi : VMNetWorkApiProtocol {
    static let sharedVMNetWorkApi = VMNetWorkApi()

    init() {
        println("VMNetWorkApi")
    }
    
    func VMRegisterAPI(Params: [String : AnyObject]?) -> Observable<RegisterModel?> {
        return Observable.create { (observer) -> Disposable in
            NLApi.sharedInstance.RegisterApi(Params, MethodType: NetWorkType.Post) { model, sjson in
                if model != nil {
                    observer.on(.Next(model))
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }
    
    func VMLoginAPI(Params : [String: AnyObject]?) -> Observable<LoginModel?> {
        return Observable.create { (observer) -> Disposable in
            NLApi.sharedInstance.LoginApi(Params, MethodType: NetWorkType.Post) { model, sjson in
                if model != nil {
                    observer.on(.Next(model))
                }
                observer.on(.Completed)
            }
            return NopDisposable.instance
        }
    }
}