//
//  EditSexViewController.swift
//  NotLonely-iOS
//
//  Created by efan on 5/19/16.
//  Copyright © 2016 cm. All rights reserved.
//

//import Cocoa
import UIKit
import RxCocoa


class EditSexViewController: UITableViewController {
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!{
        didSet{
            doneBtn.enabled = false
        }
    }
    
    let sexsTitles = ["男","女"]
    var sex:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneBtn.rx_tap
            .subscribeNext{
                Defaults[.sex] = self.sex
//                self.navigationController?.navigationBar.popNavigationItemAnimated(true)
                self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.setSelected(true, animated: true)
        if indexPath.row==0 {
            self.sex = true
        }
        doneBtn.enabled = true
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.setSelected(false, animated: true)
        doneBtn.enabled = false
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let tmpCell = tableView.dequeueReusableCellWithIdentifier("identifier"){
            tmpCell.textLabel?.text = self.sexsTitles[indexPath.row]
            return tmpCell
        }
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "identifier")
        cell.textLabel?.text = self.sexsTitles[indexPath.row]
        return cell
    }
    
    
}
