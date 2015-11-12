//
//  PeopleDetInfViewController.h
//  NotLonely
//
//  Created by  plusub on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetPublishDetModel.h"

@interface PeopleDetInfViewController : UIViewController
@property (strong, nonatomic) DetPublishDetModel *detpublishdetModel;
@property (assign, nonatomic) BOOL is_finish;
@property (strong, nonatomic) NSNumber *activityId;

@end
