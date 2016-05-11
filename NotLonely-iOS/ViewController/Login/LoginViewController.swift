//
//  LoginViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/1/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: InputTextField! {
        didSet {
            usernameTextField.setLeftImage("ic_user")
        }
    }
    
    @IBOutlet weak var passwordTextField: InputTextField! {
        didSet {
            passwordTextField.setLeftImage("ic_passwd")
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            let gradient = horizontal_gradientLayer()
            gradient.frame = self.loginButton.bounds
            loginButton.layer.insertSublayer(gradient, atIndex: 0)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewModel = LoginViewModel(
//            input: (
//                atextview: usernameTextField.rx_text.asObservable(),
//                btextview: passwordTextField.rx_text.asObservable(),
//                loginTaps: loginButton.rx_tap.asObservable()
//            ),
//            dependency: (
//                validation: DefaultValidationService.sharedValidation,
//                API: TestNetWorkApi.sharedTestNetWorkApi
//            )
//        )
//        
//        viewModel.buttonEnable.subscribeNext{ [weak self] valid  in
//            self?.loginButton.enabled = valid
//            self?.loginButton.alpha = valid ? 1.0 : 0.5
//            }
//            .addDisposableTo(disposeBag)
//        
//        viewModel.array.subscribeNext { valid  in
//            println(valid.nickname)
////            self?.model = valid
//        }.addDisposableTo(disposeBag)
        
        
        let tapBackground = UITapGestureRecognizer()
        tapBackground.rx_event
            .subscribeNext { [weak self] _ in
                self?.view.endEditing(true)
            }
            .addDisposableTo(disposeBag)
        view.addGestureRecognizer(tapBackground)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RegisterViewController" {
            println("13")
    
        }
    }
}
