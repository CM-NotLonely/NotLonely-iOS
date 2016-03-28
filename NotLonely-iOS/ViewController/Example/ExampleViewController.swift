//
//  ExampleViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/27/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private extension Selector {
    static let buttonTapped = #selector(ExampleViewController.buttonTapped(_:))
}

class ExampleViewController: BaseViewController {
    
    //纯代码规范
    lazy var testBtn: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
        button.setTitle("GO!", forState: .Normal)
        button.backgroundColor = UIColor.orangeColor()
        button.addTarget(self, action: .buttonTapped, forControlEvents: .TouchUpInside)
//        button.hidden = true
        return button
    }()
    
    //利用Selector的extension避免复杂的action
    func buttonTapped(sender: UIButton) {
        print("Push me and then just touch me. Until I can get my... Satisfaction.")
        print(Selector.buttonTapped)
    }
    
    //interface build 时，利用代码块修改属性
    @IBOutlet weak var interBtn: UIButton! {
        didSet {
            interBtn.setTitle("interBtn", forState: .Normal)
        }
    }
    //仿登陆界面
    @IBOutlet weak var ATextView: UITextField!
    @IBOutlet weak var BTextView: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(testBtn)
        
//        let AValid = ATextView.rx_text
//            .map { $0.characters.count >= 6}
//            .shareReplay(1)
//        
//        let BValid = BTextView.rx_text
//            .map { $0.characters.count >= 6}
//            .shareReplay(1)
//        
//        
//        let AllValid = Observable.combineLatest(AValid, BValid) { $0 && $1 }
//            .shareReplay(1)
//        
//        AllValid.bindTo(interBtn.rx_enabled)
//            .addDisposableTo(disposeBag)
        
        let viewModel = ExampleViewModel(
            input: (
            atextview: ATextView.rx_text.asObservable(),
            btextview: BTextView.rx_text.asObservable()
            )
        )
    }
    
    //对button按钮添加动作，利用segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "testvc" {
            print("13")
            if let exampleTableVC = segue.destinationViewController as? ExampleTableViewController {
                exampleTableVC.count = 3
            }
        }
    }

}
