//
//  SquareDetModel.m
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "SquareDetModel.h"

@implementation SquareDetModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"remark": @"remark",
             @"title": @"title",
             @"meetTime": @"meetTime",
             @"personNumberIn": @"personNumberIn",
             @"initiator": @"initiator",
             @"activityId": @"activityId",
             @"avatar": @"avatar",
             @"initiatorId": @"initiatorId",
             @"meetPlace": @"meetPlace",
             @"personNumberAll": @"personNumberAll",
             @"desc": @"desc",
             @"haspost": @"haspost"
             };
}

+ (NSValueTransformer *)avatarJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, value]];
    }];
}
@end
