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
    
    static let sharedValidation = DefaultValidationService()
    
    init() {
        print("test")
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