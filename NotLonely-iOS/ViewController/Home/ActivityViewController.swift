//
//  ActivityViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/6/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class ActivityViewController: BaseViewController {
    
    let quotes = [
        (content: "Sometimes the road less traveled is less traveled for a reason.", scene: "Jerry in The Baby Shower"),
        (content: "I can't go to a bad movie by myself. What, am I gonna make sarcastic remarks to strangers?I can't go to a bad movie by myself. What, am I gonna make sarcastic remarks to strangers?I can't go to a bad movie by myself. What, am I gonna make sarcastic remarks to strangers?", scene: "Jerry in The Chinese Restaurant"),
        (content: "You know the message you're sending out to the world with these sweatpants? You're telling the world, 'I give up. I can't compete in normal society. I'm miserable, so I might as well be comfortable.", scene: "Jerry in The Pilot"),
        (content: "Man, it's the nineties... It's Hammer time!", scene: "Kramer in The Parking Space"),
        (content: "Why is nice bad? What kind of a sick society are we living in when nice is bad?", scene: "George in The Cafe"),
        (content: "When you look annoyed all the time, people think that you're busy.", scene: "George in The Hot Tub"),
        (content: "I would drape myself in velvet if it were socially acceptable.", scene: "George in The Label Maker"),
        (content: "You know what they say, 'You don't sell the steak, you sell the sizzle.'", scene: "Kramer in The Bizzaro Jerry"),
        ]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomLayoutGuide.length, 0)

        // Do any additional setup after loading the view.
//        tableView.registerClass(ActivityCell.self, forCellReuseIdentifier: "ActivityCell")

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActivityCell") as! ActivityCell
        if indexPath.row == 0 {
            cell.contentLabel.text = quotes[0].content
        } else if indexPath.row == 1 {
            cell.contentLabel.text = quotes[1].content
        } else if indexPath.row == 2 {
            cell.contentLabel.text = quotes[2].content
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}