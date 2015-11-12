//
//  SquareDetModel.h
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SquareDetModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSString *remark;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *meetTime;
@property (strong, nonatomic) NSNumber *personNumberIn;
@property (strong, nonatomic) NSString *initiator;
@property (strong, nonatomic) NSNumber *activityId;
@property (strong, nonatomic) NSURL *avatar;
@property (strong, nonatomic) NSNumber *initiatorId;
@property (strong, nonatomic) NSString *meetPlace;
@property (strong, nonatomic) NSNumber *personNumberAll;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSNumber *haspost;

@end
