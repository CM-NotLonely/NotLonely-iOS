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
    
//    var viewModel : ExampleViewModel
//    var model : ZhihuModel
    //interface build 时，利用代码块修改属性
    @IBOutlet weak var interBtn: UIButton! {
        didSet {
            interBtn.setTitle("interBtn", forState: .Normal)
        }
    }
    //仿登陆界面
    @IBOutlet weak var ATextView: UITextField!
    @IBOutlet weak var BTextView: UITextField!

    
    @IBOutlet weak var testnetworkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(testBtn)
        
        let viewModel = ExampleViewModel(
            input: (
            atextview: ATextView.rx_text.asObservable(),
            btextview: BTextView.rx_text.asObservable(),
            loginTaps: interBtn.rx_tap.asObservable()
            ),
            dependency: (
                validation: DefaultValidationService.sharedValidation,
                API: TestNetWorkApi.sharedTestNetWorkApi
            )
        )
        
        viewModel.buttonEnable.subscribeNext{ [weak self] valid  in
            self?.interBtn.enabled = valid
            self?.interBtn.alpha = valid ? 1.0 : 0.5
            }
            .addDisposableTo(disposeBag)
        
        viewModel.array.subscribeNext { [weak self] valid  in
            print(valid.date)
//            self?.model = valid
        }
        
    }
    
    @IBAction func testNetwork(sender: AnyObject) {
        NLApi.sharedInstance.TestApi(LATEST_NEWS_URL, Params: nil, MethodType: NetWorkType.Get) {json, sjson in
            print(json)
            print(sjson)
        }
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
