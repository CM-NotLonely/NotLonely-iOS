//
//  EditViewController.swift
//  NotLonely-iOS
//
//  Created by efan on 5/16/16.
//  Copyright © 2016 cm. All rights reserved.
//

//import Cocoa
import UIKit
import RxSwift
import RxCocoa

class EditViewController: UIViewController {

    @IBOutlet weak var DoneBtn: UIBarButtonItem!
    @IBOutlet weak var inputLabel: UITextField!
    var tag:Int = 0 
    override func viewDidLoad() {
        super.viewDidLoad()
        DoneBtn.rx_tap
            .subscribeNext{
//                Defaults[]
                if let tmpText = self.inputLabel.text{
                    Defaults[.nickname] = tmpText
                }
                self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
