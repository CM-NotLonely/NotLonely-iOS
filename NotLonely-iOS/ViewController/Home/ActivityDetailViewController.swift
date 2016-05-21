//
//  ActivityDetailViewController.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/10/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit

class ActivityDetailViewController: BaseViewController {
    private let reuseIdentifier = "MemberCell"

    
    @IBOutlet weak var collectionView: UICollectionView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        println("ad")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.view.setNeedsLayout()
        self.navigationController!.view.setNeedsLayout()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ActivityDetailViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MemberCell

        //3
//        cell.imageView.image = flickrPhoto.thumbnail
        
        return cell
    }
    
}
