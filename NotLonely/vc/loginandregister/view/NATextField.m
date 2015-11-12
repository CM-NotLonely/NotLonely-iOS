//
//  NATextField.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NATextField.h"

@interface NATextField ()

@end

@implementation NATextField
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.borderStyle = UITextBorderStyleNone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.font = [UIFont systemFontOfSize:14];
        
        [self initEdit];
        [self.layer addSublayer:self.bottomBorder];
    }
    return self;
}

- (void)initEdit
{
    [[self rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(NSNumber *editing) {
        self.bottomBorder.backgroundColor = BlackColor.CGColor;
    }];
    [[self rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(NSNumber *editing) {
        self.bottomBorder.backgroundColor = GrayColor.CGColor;
    }];
}

-(CALayer *)bottomBorder
{
    if (_bottomBorder == nil) {
        _bottomBorder = [CALayer layer];
        self.bottomBorder.backgroundColor = GrayColor.CGColor;
    }
    return _bottomBorder;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _bottomBorder.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1);
}
@end
