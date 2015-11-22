//
//  NNScrollView.m
//  NotLonely
//
//  Created by  plusub on 11/22/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NNScrollView.h"

@implementation NNScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.frame = frame;
        [self addSubview:self.contentView];
    }
    return self;
}

-(UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

@end
