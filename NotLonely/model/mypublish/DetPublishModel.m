//
//  DetPublishModel.m
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetPublishModel.h"

@implementation DetPublishModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"relationList": @"relationList",
             @"initiator": @"initiator"
             };
}

+ (NSValueTransformer *)relationListJSONTransformer
{
    NSMutableArray *obArray = [[NSMutableArray alloc] init];
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
                for (NSDictionary *dic in array) {
                    DetPublishDetModel *file = [MTLJSONAdapter modelOfClass:DetPublishDetModel.class fromJSONDictionary:dic error:nil];
                    [obArray addObject:file];
                }
                return obArray;
            } reverseBlock:
            ^id(NSMutableArray *fileArray, BOOL *success, NSError *__autoreleasing *error) {
                return fileArray;
            }];
}

+ (NSValueTransformer *)initiatorJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSDictionary *value, BOOL *success, NSError *__autoreleasing *error) {
        DetPublishDetModel *model = [MTLJSONAdapter modelOfClass:DetPublishDetModel.class fromJSONDictionary:value error:nil];
        return [MTLJSONAdapter modelOfClass:DetPublishDetModel.class fromJSONDictionary:value error:nil];
    }];
}
@end
