//
//  CircleViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/6/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class CircleViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = UIRectEdge.All

//        self.tableView.contentInset = UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CircleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CircleCell") as! CircleCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}