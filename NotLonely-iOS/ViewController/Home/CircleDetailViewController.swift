//
//  CircleDetailViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/10/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class CircleDetailViewController: BaseViewController {

    var overlay: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //看下原理
        self.navigationController!.navigationBar.barTintColor = UIColor.clearColor()
        self.navigationController?.navigationBar.nl_setBackgroundColor(UIColor.clearColor())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        println("basevc viewWillAppear")
        self.navigationController!.navigationBar.shadowImage = UIImage.init()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.nl_reset()
        self.navigationController?.navigationBar.nl_setBackgroundColor(UIColor.NLMainColor())

    }
}

extension CircleDetailViewController: UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = UIColor.NLMainColor()
        let offsetY = scrollView.contentOffset.y
        if offsetY > 50 {
            let alpha = min(1, 1 - ((50 + 64 - offsetY) / 64))
            self.navigationController?.navigationBar.nl_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            self.navigationController?.navigationBar.nl_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("text", forIndexPath: indexPath)
        cell.textLabel?.text = "12134"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
}
