//
//  ImageWithColor.h
//  edx-app-ios
//
//  Created by tesths on 10/20/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageWithColor : NSObject
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color withFrame:(CGRect)rect;
@end
