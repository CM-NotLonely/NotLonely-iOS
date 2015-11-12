//
//  CustomHud.m
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "CustomHud.h"
#if __has_feature(objc_arc)
#define MB_AUTORELEASE(exp) exp
#define MB_RELEASE(exp) exp
#define MB_RETAIN(exp) exp
#else
#define MB_AUTORELEASE(exp) [exp autorelease]
#define MB_RELEASE(exp) [exp release]
#define MB_RETAIN(exp) [exp retain]
#endif
@implementation CustomHud

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Set default values for properties
        self.animationType = MBProgressHUDAnimationFade;
        self.mode = MBProgressHUDModeIndeterminate;
        self.labelText = @"请等待^^";
    }
    return self;
}

@end
