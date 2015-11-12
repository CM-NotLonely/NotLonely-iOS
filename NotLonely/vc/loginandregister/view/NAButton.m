//
//  NAButton.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NAButton.h"

@implementation NAButton
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

@end
