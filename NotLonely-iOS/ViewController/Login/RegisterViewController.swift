//
//  RegisterViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/27/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

protocol RegisterDelegate {
    func updateTextField()
}


class RegisterViewController: BaseViewController {
    
    var delegate: RegisterDelegate?
    
    @IBOutlet weak var usernameTextField: InputTextField! {
        didSet {
            usernameTextField.setPlaceHolderTextColor("用户名")
            usernameTextField.setLeftImage("ic_user")
        }
    }
    
    @IBOutlet weak var passwordTextField: InputTextField! {
        didSet {
            passwordTextField.setPlaceHolderTextColor("密码")
            passwordTextField.setLeftImage("ic_passwd")
        }
    }
    
    @IBOutlet weak var repasswordTextField: InputTextField! {
        didSet {
            repasswordTextField.setPlaceHolderTextColor("密码")
            repasswordTextField.setLeftImage("ic_passwd")
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            let gradient = vertical_gradientLayer()
            gradient.frame = self.registerButton.bounds
            registerButton.layer.insertSublayer(gradient, atIndex: 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.shadowImage = UIImage.init()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), forBarMetrics: .Default)
        
        let viewModel = RegisterViewModel(
            input: (
                usertextview: usernameTextField.rx_text.asObservable(),
                pwdtextview: passwordTextField.rx_text.asObservable(),
                repwdtextview: repasswordTextField.rx_text.asObservable(),
                
                buttonTaps: registerButton.rx_tap.asObservable()
            ),
            dependency: (
                validation: NLValidationService.sharedValidation,
                API: VMNetWorkApi.sharedTestNetWorkApi
            )
        )
        
        viewModel.buttonEnable.subscribeNext{ [weak self] valid  in
            self?.registerButton.enabled = valid
            self?.registerButton.alpha = valid ? 1.0 : 0.5
            }
            .addDisposableTo(disposeBag)
        
        viewModel.model.subscribeNext { valid  in
                self.showHudTipStr(valid.msg)
                self.delegate?.updateTextField()
            self.dismissViewControllerAnimated(true, completion: {
                println(valid.msg)
            })
            }
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func backToLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
