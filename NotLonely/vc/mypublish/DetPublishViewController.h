//
//  DetPublishViewController.h
//  NotLonely
//
//  Created by tesths on 11/6/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetPublishViewController : UIViewController
//0是我发布的 1是别人发布的
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSNumber *activityId;
@property (assign, nonatomic) BOOL is_finish;
@end
