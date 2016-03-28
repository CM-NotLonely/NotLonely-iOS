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
    
    let validatedATextView: Observable<String>
    let validatedBTextView: Observable<String>
//    let buttonEnable: Observable<Bool>

    init(input: (atextview: Observable<String>, btextview: Observable<String>)) {
        validatedATextView = input.atextview
        validatedBTextView = input.btextview
        
//        validatedATextView.subscribeNext { (String) in
//            print(String)
//        }
        
//        buttonEnable = Observable.combineLatest(validatedATextView,validatedBTextView)
//            { atextview, btextview in
//                atextview.isva
//            }
    }

}
