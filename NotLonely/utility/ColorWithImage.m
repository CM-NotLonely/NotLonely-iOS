//
//  ColorWithImage.m
//  edx-app-ios
//
//  Created by tesths on 10/18/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "ColorWithImage.h"

@implementation ColorWithImage
+ (UIColor *)colorWithImg:(CGRect)frame withImage:(NSString *)imgname
{
    UIGraphicsBeginImageContext(frame.size);
    [[UIImage imageNamed:imgname] drawInRect:frame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}
@end
