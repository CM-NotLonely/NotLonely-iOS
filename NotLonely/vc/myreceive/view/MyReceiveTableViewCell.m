//
//  MyReceiveTableViewCell.m
//  NotLonely
//
//  Created by tesths on 10/23/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyReceiveTableViewCell.h"

@interface MyReceiveTableViewCell ()
@property (strong, nonatomic) UIImageView *headImg;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *statusLabel;

@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UILabel *numberLabel;

@property (strong, nonatomic) UIImageView *lineImg;
@property (strong, nonatomic) MyReceiveDetModel *myreceivedetModel;

@end

@implementation MyReceiveTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dateLabel];

        [self.contentView addSubview:self.statusLabel];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.numberLabel];
        
        [self.contentView addSubview:self.lineImg];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.height.equalTo(@50);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImg);
        make.left.equalTo(self.headImg.mas_right).offset(10);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.centerY.equalTo(self.nameLabel);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.centerY.equalTo(self.nameLabel);
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
    
    [self.lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(@5);
    }];
}

- (void)setCellData:(MyReceiveDetModel *)myreceivedetModel
{
    self.myreceivedetModel = myreceivedetModel;
    if (!self.myreceivedetModel) {
        return;
    }
    [self.headImg setImageWithURL:self.myreceivedetModel.avatar placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    

    self.nameLabel.text = self.myreceivedetModel.initiator;
    self.dateLabel.text = self.myreceivedetModel.meetTime;
    if ([self.myreceivedetModel.is_finish boolValue]) {
        self.statusLabel.text = @"活动已结束^^";
    } else {
        if ([self.myreceivedetModel.relationDeal boolValue]) {
            self.statusLabel.text = @"发起者已同意~";
        } else {
            self.statusLabel.text = @"等待同意中^^";
        }
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"已有%@人参加", self.myreceivedetModel.personNumberIn];
    self.contentLabel.text = self.myreceivedetModel.desc;
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
        _headImg.layer.cornerRadius = 25;
        _headImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap.rac_gestureSignal subscribeNext:^(id x) {
            [self.delegate peopleDetInf];
        }];
        [_headImg addGestureRecognizer:tap];
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
-(UILabel *)statusLabel
{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.font = [UIFont systemFontOfSize:14];
    }
    return _statusLabel;
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
@end
