//
//  MyPublishTBHeader.m
//  NotLonely
//
//  Created by tesths on 10/16/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyPublishTBHeader.h"

@implementation MyPublishTBHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headImg];
        [self addSubview:self.nameLabel];
        [self addSubview:self.sexLabel];
        [self addSubview:self.lineImg];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@70);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImg.mas_bottom).offset(10);
        make.centerX.equalTo(self.headImg);
    }];
    
    [self.sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self.nameLabel);
    }];
    [self.lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@4);
    }];
}

-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc] init];
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 35;
    }
    return _headImg;
}

-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

-(UILabel *)sexLabel
{
    if (_sexLabel == nil) {
        _sexLabel = [[UILabel alloc] init];
        _sexLabel.font = [UIFont systemFontOfSize:14];
    }
    return _sexLabel;
}

-(UIImageView *)lineImg
{
    if (_lineImg == nil) {
        _lineImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_blue_wave"]];
    }
    return _lineImg;
}
@end
