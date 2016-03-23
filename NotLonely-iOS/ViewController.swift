//
//  ViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/10/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        NNNetWork.Get()
        
//        NNNetWork.Get(BASE_URL, params: nil, success: { (json, sjson) -> Void in
//            print(json)
//            print(sjson)
//            }) { (error) -> Void in
//                print(error)
//        }
//        
//        test("adf");
        NNApi.TestApi(BASE_URL, params: nil) { (json, sjson) -> Void in
            print(json)
            print(sjson)
        }
        
        test("a")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func test(test : AnyObject) {
        print("asdf")
        let urlSting = "TT://"
        // 2
        if let url = NSURL(string: urlSting) {
            // 3
            let application = UIApplication.sharedApplication()
            // 4
            if application.canOpenURL(url) {
                // 5
                application.openURL(url)
            }
        }
    }

}

