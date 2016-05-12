//
//  LoginViewModel.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit


class LoginViewModel {
    
    let validatedUserNameTextView: Observable<Bool>
    let validatedPassWordTextView: Observable<Bool>
    
    
    let buttonEnable: Observable<Bool>
    
    let model: Observable<LoginModel>
    
    init(
        input: (
        
        usertextview: Observable<String>,
        pwdtextview: Observable<String>,
        buttonTaps: Observable<Void>),
        
        dependency: (
        
        validation: ValidationService,
        API: VMNetWorkApi)
        
        ) {
        
        let validationService = dependency.validation
        let API = dependency.API
        
        validatedUserNameTextView = input.usertextview
            .map{ str in
                return validationService.validateString(str)
            }
            .shareReplay(1)
        
        validatedPassWordTextView = input.pwdtextview
            .map{ str in
                return validationService.validateString(str)
            }
            .shareReplay(1)
        
        buttonEnable = Observable.combineLatest(validatedUserNameTextView, validatedPassWordTextView) { $0 && $1 }
            .distinctUntilChanged()
        
        let usernameAndPassword = Observable.combineLatest(input.usertextview, input.pwdtextview) { ($0, $1) }
        
        model = input.buttonTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) in
                return API.VMLoginAPI(["username": username, "password": password])
                    .observeOn(MainScheduler.instance)
            }
            .map { model in
                return model!
            }
            .shareReplay(1)
    }
    
}