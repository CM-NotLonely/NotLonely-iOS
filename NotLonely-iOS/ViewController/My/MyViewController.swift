//
//  MyViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxCocoa

class MyViewController: UIViewController {

    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!

    @IBOutlet weak var bgImageView: UIImageView!{
        didSet{
            bgImageView.contentMode = .ScaleAspectFill
            self.view.clipsToBounds = true
        }
    }
    @IBOutlet weak var avatorImageView: UIImageView!{
        didSet{
            avatorImageView.contentMode = .ScaleAspectFill
        
        }
    }
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    var titleText = ["我的主页","我关注的","发布的活动","参与的活动","点赞的活动"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        let imageURLString = Defaults[.url]
        let image = UIImage(contentsOfFile: imageURLString)
        bgImageView.image = image
        avatorImageView.image = image

        self.usernameLabel.text = Defaults[.nickname]
        self.introLabel.text = Defaults[.introduction]
        self.focusLabel.text = "99个人关注了我"
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




extension MyViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTableViewCell") as! MyTableViewCell
        cell.leadingLabel.text = titleText[indexPath.row]
        if indexPath.row>1{
            cell.trailingLabel.text = "20次活动"
        }
        return cell
    }
}
