//
//  PublishViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class PublishViewController: BaseViewController {
    @IBOutlet weak var titleTextField: InputTextField! {
        didSet {
            titleTextField.setLeftImage("ic_passwd")
            titleTextField.setlineColor(UIColor.NLMainColor())

        }
    }
    @IBOutlet weak var timeTextField: InputTextField! {
        didSet {
            timeTextField.setLeftImage("ic_time")
            timeTextField.setlineColor(UIColor.NLMainColor())
        }
    }
    @IBOutlet weak var locationTextField: InputTextField! {
        didSet {
            locationTextField.setLeftImage("ic_location")
            locationTextField.setlineColor(UIColor.NLMainColor())
        }
    }
    @IBOutlet weak var memberTextField: InputTextField! {
        didSet {
            memberTextField.setLeftImage("ic_member")
            memberTextField.setlineColor(UIColor.NLMainColor())
        }
    }
    @IBOutlet weak var costTextField: InputTextField! {
        didSet {
            costTextField.setLeftImage("ic_cost")
            costTextField.setlineColor(UIColor.NLMainColor())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func dismissAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
