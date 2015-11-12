//
//  BlackODRefreshControl.m
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "BlackODRefreshControl.h"

@implementation BlackODRefreshControl
-(instancetype)initInScrollView:(UIScrollView *)scrollView
{
    self = [super initInScrollView:scrollView];
    if (self) {
        self.tintColor = BlackColor;
    }
    return self;
}
@end
