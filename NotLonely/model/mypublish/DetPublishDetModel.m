//
//  DetPublishDetModel.m
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetPublishDetModel.h"

@implementation DetPublishDetModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"personInId": @"personInId",
             @"personInAvatar": @"personInAvatar",
             @"sex": @"sex",
             @"personInNickname": @"personInNickname",
             @"commit": @"commit",
             @"relationDeal": @"relationDeal",
             @"desc": @"desc",
             @"tag": @"tag"//就这有问题！！！
             };
}

+ (NSValueTransformer *)personInAvatarJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, value]];
    }];
}

+ (NSValueTransformer *)tagInAvatarJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
        return [array componentsJoinedByString:@","];;
    }];
}
@end
