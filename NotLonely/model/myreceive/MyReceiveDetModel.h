//
//  MyReceiveDetModel.h
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MyReceiveDetModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSString *remark;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *meetTime;
@property (strong, nonatomic) NSNumber *personNumberIn;
@property (strong, nonatomic) NSString *initiator;
@property (strong, nonatomic) NSNumber *is_finish;
@property (strong, nonatomic) NSNumber *activityId;
@property (strong, nonatomic) NSString *tag;
@property (strong, nonatomic) NSURL *avatar;
@property (strong, nonatomic) NSNumber *initiatorId;
@property (strong, nonatomic) NSNumber *relationDeal;
@property (strong, nonatomic) NSString *meetPlace;
@property (strong, nonatomic) NSNumber *personNumberAll;
@property (strong, nonatomic) NSString *desc;

@end
