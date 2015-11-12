//
//  MyReceiveDetModel.m
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyReceiveDetModel.h"

@implementation MyReceiveDetModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"remark": @"remark",
             @"title": @"title",
             @"meetTime": @"meetTime",
             @"personNumberIn": @"personNumberIn",
             @"initiator": @"initiator",
             @"is_finish": @"is_finish",
             @"activityId": @"activityId",
             @"tag": @"tag",
             @"avatar": @"avatar",
             @"initiatorId": @"initiatorId",
             @"relationDeal": @"relationDeal",
             @"meetPlace": @"meetPlace",
             @"personNumberAll": @"personNumberAll",
             @"desc": @"desc"
             };
}

+ (NSValueTransformer *)avatarJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, value]];
    }];
}
@end
