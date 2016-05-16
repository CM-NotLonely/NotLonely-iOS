//
//  Protocol.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/9/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation


protocol ValidationService {
    func validateString(string: String) -> Bool
    func validateSameString(password: String, repeatedPassword: String) -> Bool
    func validateStringEmpty(string: String) -> Bool

}

protocol VMNetWorkApiProtocol {
    func VMRegisterAPI(Params : [String: AnyObject]?) -> Observable<RegisterModel?>
    func VMLoginAPI(Params : [String: AnyObject]?) -> Observable<LoginModel?>

}
