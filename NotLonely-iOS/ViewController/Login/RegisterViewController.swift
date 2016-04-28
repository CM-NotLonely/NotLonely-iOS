//
//  RegisterViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/27/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
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
    }
    
    @IBAction func backToLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
