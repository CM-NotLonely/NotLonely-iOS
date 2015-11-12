//
//  MyReceiveModel.m
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyReceiveModel.h"

@implementation MyReceiveModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"myRequestList": @"myRequestList",
             @"initiator": @"initiator"
             };
}

+ (NSValueTransformer *)myRequestListJSONTransformer
{
    NSMutableArray *obArray = [[NSMutableArray alloc] init];
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
                for (NSDictionary *dic in array) {
                    MyReceiveDetModel *file = [MTLJSONAdapter modelOfClass:MyReceiveDetModel.class fromJSONDictionary:dic error:nil];
                    [obArray addObject:file];
                }
                return obArray;
            } reverseBlock:
            ^id(NSMutableArray *fileArray, BOOL *success, NSError *__autoreleasing *error) {
                return fileArray;
            }];
}
@end
