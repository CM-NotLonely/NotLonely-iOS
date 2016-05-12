//
//  File.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/9/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation


class RegisterViewModel {
    
    let validatedUserNameTextView: Observable<Bool>
    let validatedPassWordTextView: Observable<Bool>
    let validatedRePassWordTextView: Observable<Bool>
    

    let buttonEnable: Observable<Bool>
    
    let model: Observable<RegisterModel>
    
    init(
        input: (
        
        usertextview: Observable<String>,
        pwdtextview: Observable<String>,
        repwdtextview: Observable<String>,
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
        
        validatedRePassWordTextView =
            Observable.combineLatest(input.pwdtextview, input.repwdtextview, resultSelector: validationService.validateSameString)
            .shareReplay(1)
        
        
        buttonEnable = Observable.combineLatest(validatedUserNameTextView, validatedPassWordTextView, validatedRePassWordTextView) { $0 && $1 && $2 }
            .distinctUntilChanged()
        
        let usernameAndPassword = Observable.combineLatest(input.usertextview, input.pwdtextview, input.repwdtextview) { ($0, $1, $2) }
        
        model = input.buttonTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password, repassword) in
                return API.VMRegisterAPI(["username": username, "password": password, "password_confirmation": repassword])
                    .observeOn(MainScheduler.instance)
            }
            .map { model in
                return model!
            }
            .shareReplay(1)
    }
    
}