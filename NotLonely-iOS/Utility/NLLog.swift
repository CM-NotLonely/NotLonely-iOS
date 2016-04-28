//
//  NLLog.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/28/16.
//  Copyright © 2016 cm. All rights reserved.
//

import Foundation

func println(object: Any) {
    #if DEBUG
        Swift.print(object)
    #endif
}
