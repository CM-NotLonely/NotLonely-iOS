//
//  DetSquareViewController.h
//  NotLonely
//
//  Created by tesths on 11/6/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareDetModel.h"

@interface DetSquareViewController : UIViewController
@property (strong, nonatomic) SquareDetModel *squaredetModel;
@property (strong, nonatomic) NSString *tag;
@end
