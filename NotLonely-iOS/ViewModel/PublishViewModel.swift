//
//  File.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/9/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation


class PublishViewModel {
    
    let validatedtitleTextField: Observable<Bool>
    let validatedtimeTextField: Observable<Bool>
    let validatedlocationTextField: Observable<Bool>
    let validatedmemberTextField: Observable<Bool>
    let validatedcostTextField: Observable<Bool>

    let validateddetailTextView: Observable<Bool>

    
    let buttonEnable: Observable<Bool>
    
    let model: Observable<RegisterModel>
    
    init(
        input: (
        
        title: Observable<String>,
        time: Observable<String>,
        location: Observable<String>,
        member: Observable<String>,
        cost: Observable<String>,
        
        detail: Observable<String>,
        
        buttonTaps: Observable<Void>),
        
        dependency: (
        
        validation: ValidationService,
        API: VMNetWorkApi)
        
        ) {
        
        let validationService = dependency.validation
        let API = dependency.API
        
        validatedtitleTextField = input.title
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        validatedtimeTextField = input.time
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        validatedlocationTextField = input.location
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        validatedmemberTextField = input.member
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        validatedcostTextField = input.cost
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        validateddetailTextView = input.detail
            .map{ str in
                return validationService.validateStringEmpty(str)
            }
            .shareReplay(1)
        
        //这样写会报错 虽然在库中可以，但是加上distinctUntilChanged之后编译器不识别
        
        //Observable.combineLatest(validatedtitleTextField, validatedtimeTextField, validatedlocationTextField, validatedmemberTextField, validatedcostTextField, validateddetailTextView) { $0 && $1 && $2 && $3 && $4 && $5 }.distinctUntilChanged()
        let first = Observable.combineLatest(validatedtitleTextField, validatedtimeTextField, validatedlocationTextField) { $0 && $1 && $2 }
            .distinctUntilChanged()
        
        let second = Observable.combineLatest(validatedmemberTextField, validatedcostTextField, validateddetailTextView) { $0 && $1 && $2}
            .distinctUntilChanged()
        
        buttonEnable = Observable.combineLatest(first, second) { $0 && $1}
            .distinctUntilChanged()
        
        let usernameAndPassword = Observable.combineLatest(input.title, input.time, input.location, input.member, input.cost, input.detail) { ($0, $1, $2, $3, $4, $5) }
        
        model = input.buttonTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (title, time, location, member, cost, detail) in
                return API.VMRegisterAPI(["username": title, "password": time, "password_confirmation": location])
                    .observeOn(MainScheduler.instance)
            }
            .map { model in
                return model!
            }
            .shareReplay(1)
    }
    
}