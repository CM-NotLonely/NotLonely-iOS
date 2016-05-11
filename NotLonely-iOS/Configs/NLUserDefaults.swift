//
//  NLUserDefaults.swift
//  NotLonely-iOS
//
//  Created by plusub on 5/11/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

extension DefaultsKeys {
    static let username = DefaultsKey<String?>("username")
    static let password = DefaultsKey<String?>("password")
    
    static let launchCount = DefaultsKey<Int>("launchCount")
}