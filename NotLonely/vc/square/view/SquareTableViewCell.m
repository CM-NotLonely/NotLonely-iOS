//
//  SquareTableViewCell.m
//  NotLonely
//
//  Created by tesths on 10/23/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "SquareTableViewCell.h"

@interface SquareTableViewCell ()

@property (strong, nonatomic) SquareDetModel *squaredetModel;
@property (strong, nonatomic) UIImageView *lineImg;

@property (strong, nonatomic) UIImageView *headImg;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *habitLabel;

@property (strong, nonatomic) UILabel *contentLabel;

@property (strong, nonatomic) UIButton *starBtn;
@property (strong, nonatomic) UIButton *chatBtn;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UIButton *acceptBtn;
@end

@implementation SquareTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.habitLabel];
        
        [self.contentView addSubview:self.contentLabel];

        [self.contentView addSubview:self.numberLabel];
        [self.contentView addSubview:self.acceptBtn];
        
        [self.contentView addSubview:self.lineImg];
        
        self.nameLabel.text = @"123123";
        self.titleLabel.text = @"boy";
        self.dateLabel.text = @"2015.3.3";
        self.numberLabel.text = @"已有3人参加";
        self.contentLabel.text = @"I want  a boy who can play basketball with me.";
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.height.equalTo(@44);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImg.mas_top).offset(2);
        make.left.equalTo(self.headImg.mas_right).offset(10);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.centerY.equalTo(self.nameLabel);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.bottom.equalTo(self.headImg.mas_bottom).offset(-3);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImg.mas_bottom).offset(10);
        make.left.equalTo(self.headImg.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_left);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(3);
    }];
    [self.acceptBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.equalTo(self.numberLabel);
    }];
    
    [self.lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(@5);
    }];
}

- (void)sendTakein
{
    NSDictionary *para = @{@"activityId":self.squaredetModel.activityId};
    [[[NetWork sharedManager] request_Takein:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            self.acceptBtn.hidden = YES;
        }
    }];
}

- (void)setCellData:(SquareDetModel *)squaredetModel
{
    self.squaredetModel = squaredetModel;
    if (!_squaredetModel) {
        return;
    }
    if ([self.squaredetModel.haspost boolValue]) {
        self.acceptBtn.hidden = YES;
    } else {
        self.acceptBtn.hidden = NO;
    }
    [self.headImg setImageWithURL:self.squaredetModel.avatar placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
    self.nameLabel.text = self.squaredetModel.initiator;
    self.titleLabel.text = [NSString stringWithFormat:@"NA：%@", self.squaredetModel.title] ;
    self.dateLabel.text = self.squaredetModel.meetTime;
    self.numberLabel.text = [NSString stringWithFormat:@"已有%@人参加", self.squaredetModel.personNumberIn];
    self.contentLabel.text = self.squaredetModel.desc;
}

-(UIImageView *)lineImg
{
    if (_lineImg == nil) {
        _lineImg = [[UIImageView alloc] init];
        NSInteger randomNumber = arc4random() % 4;
        switch (randomNumber) {
            case 0:
                _lineImg.image = [UIImage imageNamed:@"ic_blue_wave"];
                break;
            case 1:
                _lineImg.image = [UIImage imageNamed:@"ic_orange_wave"];
                break;
            case 2:
                _lineImg.image = [UIImage imageNamed:@"ic_pink_wave"];
                break;
            case 3:
                _lineImg.image = [UIImage imageNamed:@"ic_green_wave"];
                break;
            default:
                break;
        }
    }
    return _lineImg;
}

-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc] init];
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 22;
    }
    return _headImg;
}

-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

-(UILabel *)dateLabel
{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = [UIFont systemFontOfSize:14];
    }
    return _dateLabel;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];;
    }
    return _titleLabel;
}

-(UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _contentLabel;
}

-(UILabel *)numberLabel
{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = GrayColor;
        _numberLabel.font = [UIFont systemFontOfSize:13];
    }
    return _numberLabel;
}

-(UIButton *)acceptBtn
{
    if (_acceptBtn == nil) {
        _acceptBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_acceptBtn setTitle:@"我要参与" forState:UIControlStateNormal];
        [_acceptBtn setTitleColor:BlueColor forState:UIControlStateNormal];
        _acceptBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [[_acceptBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendTakein];
        }];
    }
    return _acceptBtn;
}
@end
