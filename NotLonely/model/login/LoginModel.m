//
//  LoginModel.m
//  NotLonely
//
//  Created by tesths on 11/11/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"username": @"username",
             @"sex": @"sex",
             @"phone": @"phone",
             @"avatar": @"avatar",
             @"nickname": @"nickname",
             @"tag": @"tag"
             };
}

+ (NSValueTransformer *)avatarJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSString stringWithFormat:@"%@%@", BASE_URL, value];
    }];
}

+ (NSValueTransformer *)sexJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isEqualToString:@"男"]) {
            return @"男 👨🏻";
        } else {
            return @"女 👩🏻";
        }
        
    }];
}

//+ (NSValueTransformer *)tagJSONTransformer {
//    
//    NSMutableArray *obArray = [[NSMutableArray alloc] init];
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
//        for (NSDictionary *dic in array) {
//            [obArray addObject:];
//        }
//        return obArray;
//    }];
//}
@end
