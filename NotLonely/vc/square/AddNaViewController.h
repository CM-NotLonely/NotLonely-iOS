//
//  AddNaViewController.h
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddNaViewControllerControllerDelegate <NSObject>
- (void)refreshList;
@end

@interface AddNaViewController : UIViewController
@property (nonatomic, assign) id<AddNaViewControllerControllerDelegate> delegate;
@end
