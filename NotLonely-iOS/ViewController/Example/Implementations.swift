//
//  Implementations.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

import RxSwift

class DefaultValidationService: ValidationService {
    func validateATextView(atextview: String) -> Observable<ValidationResult> {
        if atextview.characters.count == 0 {
            return Observable.just(.Empty)
        }
        
        if atextview.rangeOfCharacterFromSet(NSCharacterSet.alphanumericCharacterSet().invertedSet) != nil {
            return Observable.just(.Failed(message: "Username can only contain numbers or digits"))
        }
        
        return Observable.just(.OK(message: "Username can only contain numbers or digits"))
        
    }
    
    func validateBTextView(btextview: String) -> ValidationResult {
        let numberOfCharacters = btextview.characters.count
        if numberOfCharacters == 0 {
            return .Empty
        }
        
        if numberOfCharacters < 6 {
            return .Failed(message: "Password must be at least \(6) characters")
        }
        
        return .OK(message: "Password acceptable")
    }
}