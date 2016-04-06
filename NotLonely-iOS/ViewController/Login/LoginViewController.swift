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

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            let gradient = gradientLayer()
            gradient.frame = self.loginButton.bounds
            loginButton.layer.insertSublayer(gradient, atIndex: 0)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.insertSublayer(gradientLayer(), atIndex: 0)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func viewWillAppear(animated: Bool) {
        print("LoginViewController")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
