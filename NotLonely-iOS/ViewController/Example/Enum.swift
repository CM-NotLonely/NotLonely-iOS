//
//  Enum.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

enum ValidationResult {
    case OK(message: String)
    case Empty
    case Validating
    case Failed(message: String)
}

protocol ValidationService {
    func validateString(string: String) -> Bool
}

protocol DefaultApi {
    func testNetwork(Params : [String: AnyObject]?) -> Observable<JSON?>
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .OK:
            return true
        default:
            return false
        }
    }
}