//
//  MyViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxCocoa

class MyViewController: BaseViewController {

    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var focusLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rightBarBtn.rx_tap
            .subscribeNext{
                
        }
            
        
        leftBarBtn.rx_tap
            .subscribeNext{
                
        }
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
