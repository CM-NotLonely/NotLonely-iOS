//
//  NAFirstTextField.m
//  NotLonely
//
//  Created by  plusub on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NAFirstTextField.h"

@implementation NAFirstTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.bottomBorder.backgroundColor = GrayColor.CGColor;
    }
    return self;
}

@end
