//
//  MyPublishModel.m
//  NotLonely
//
//  Created by tesths on 11/8/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyPublishModel.h"
#import "MyPublishDetModel.h"

@implementation MyPublishModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"myPostList": @"myPostList"
             };
}

+ (NSValueTransformer *)myPostListJSONTransformer
{
    NSMutableArray *obArray = [[NSMutableArray alloc] init];
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
                for (NSDictionary *dic in array) {
                    MyPublishDetModel *file = [MTLJSONAdapter modelOfClass:MyPublishDetModel.class fromJSONDictionary:dic error:nil];
                    [obArray addObject:file];
                }
                return obArray;
            } reverseBlock:
            ^id(NSMutableArray *fileArray, BOOL *success, NSError *__autoreleasing *error) {
                return fileArray;
            }];
}
@end
