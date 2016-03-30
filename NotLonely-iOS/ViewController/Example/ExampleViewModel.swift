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

class ExampleViewModel {
    
    let validatedATextView: Observable<Bool>
    let validatedBTextView: Observable<Bool>
    let buttonEnable: Observable<Bool>
    
    init(input: (atextview: Observable<String>, btextview: Observable<String>, validation: ValidationService)) {
        
        let validationService = input.validation
        
        validatedATextView = input.atextview
            .map{ atextview in
                print(atextview)
                return validationService.validateString(atextview)
            }
            .shareReplay(1)
        
        validatedBTextView = input.btextview
            .map{ atextview in
                return validationService.validateString(atextview)
            }
            .shareReplay(1)

        buttonEnable = Observable.combineLatest(validatedATextView, validatedBTextView) { $0 && $1 }.distinctUntilChanged()

    }

}
