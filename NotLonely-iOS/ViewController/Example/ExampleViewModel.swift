//
//  ExampleViewModel.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/27/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

class ExampleViewModel {
    
    let validatedATextView: Observable<Bool>
    let validatedBTextView: Observable<Bool>
    let buttonEnable: Observable<Bool>
    
//    let signedIn: Observable<AnyObject>
    let array: Observable<LoginModel>

    init(input: (atextview: Observable<String>, btextview: Observable<String>, loginTaps: Observable<Void>), dependency: (validation: ValidationService, API: VMNetWorkApi)) {
        
        let validationService = dependency.validation
        let API = dependency.API
        
        validatedATextView = input.atextview
            .map{ atextview in
                println(atextview)
                return validationService.validateString(atextview)
            }
            .shareReplay(1)
        
        validatedBTextView = input.btextview
            .map{ atextview in
                return validationService.validateString(atextview)
            }
            .shareReplay(1)
        

        buttonEnable = Observable.combineLatest(validatedATextView, validatedBTextView) { $0 && $1 }
            .distinctUntilChanged()

        let usernameAndPassword = Observable.combineLatest(input.atextview, input.btextview) { ($0, $1) }

//        typealias JSONDictionary = [String: AnyObject]

        array = input.loginTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) in
                return API.VMRegisterAPI(["test": username,"phone_code": password])
            }
            .map { (json) in
                return LoginModel(json: json!)
//                array = Observable.create(test)
            }
        
        
    }

}
