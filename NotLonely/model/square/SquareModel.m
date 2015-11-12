//
//  SquareModel.m
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "SquareModel.h"
#import "SquareDetModel.h"

@implementation SquareModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"items": @"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer
{
    NSMutableArray *obArray = [[NSMutableArray alloc] init];
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
                for (NSDictionary *dic in array) {
                    SquareDetModel *file = [MTLJSONAdapter modelOfClass:SquareDetModel.class fromJSONDictionary:dic error:nil];
                    [obArray addObject:file];
                }
                return obArray;
            } reverseBlock:
            ^id(NSMutableArray *fileArray, BOOL *success, NSError *__autoreleasing *error) {
                return fileArray;
            }];
}
@end
