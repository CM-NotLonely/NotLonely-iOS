//
//  HomeViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 3/24/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var overlay: UIView!
    
    
    @IBOutlet weak var testTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.navigationController!.navigationBar.backgroundColor = UIColor.clearColor()
//        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.nl_setBackgroundColor(UIColor.clearColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.shadowImage = nil
        scrollViewDidScroll(testTableView)
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()


//        self.navigationController?.navigationBar.backgroundImageForBarMetrics(.Default)
//        self.overlay = UIView(frame: CGRectMake(0, -20, CGRectGetWidth((self.navigationController?.navigationBar.bounds)!), CGRectGetHeight((self.navigationController?.navigationBar.bounds)!) + 20))
//        self.overlay.userInteractionEnabled = false
//        self.overlay.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//        self.navigationController?.navigationBar.insertSubview(self.overlay, atIndex: 0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.nl_reset()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

extension HomeViewController: UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = UIColor.NLMainColor()
        let offsetY = scrollView.contentOffset.y
        if offsetY > 50 {
            let alpha = min(1, 1 - ((50 + 64 - offsetY) / 64))
            self.navigationController?.navigationBar.nl_setBackgroundColor(color.colorWithAlphaComponent(alpha))
//            self.navigationController?.navigationBar.backgroundColor = color.colorWithAlphaComponent(alpha)
//            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//
//            self.overlay = UIView(frame: CGRectMake(0, -20, CGRectGetWidth((self.navigationController?.navigationBar.bounds)!), CGRectGetHeight((self.navigationController?.navigationBar.bounds)!) + 20))
//            self.overlay.userInteractionEnabled = false
//            self.overlay.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//            self.navigationController?.navigationBar.insertSubview(self.overlay, atIndex: 0)
//            self.overlay.backgroundColor = color.colorWithAlphaComponent(alpha)
        } else {
            self.navigationController?.navigationBar.nl_setBackgroundColor(color.colorWithAlphaComponent(0))
//            self.navigationController?.navigationBar.backgroundColor = color.colorWithAlphaComponent(0)
//            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//            self.overlay = UIView(frame: CGRectMake(0, -20, CGRectGetWidth((self.navigationController?.navigationBar.bounds)!), CGRectGetHeight((self.navigationController?.navigationBar.bounds)!) + 20))
//            self.overlay.userInteractionEnabled = false
//            self.overlay.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//            self.navigationController?.navigationBar.insertSubview(self.overlay, atIndex: 0)
//            self.overlay.backgroundColor = color.colorWithAlphaComponent(0)
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