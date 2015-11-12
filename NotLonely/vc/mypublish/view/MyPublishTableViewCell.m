//
//  MyPublishTableViewCell.m
//  NotLonely
//
//  Created by tesths on 10/16/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyPublishTableViewCell.h"

@interface MyPublishTableViewCell ()
@property (strong, nonatomic) UILabel *numberLb;
@property (strong, nonatomic) UILabel *statusLb;
@property (strong, nonatomic) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (strong, nonatomic) MyPublishDetModel *mypublishdetModel;
@property (assign, nonatomic) NSUInteger row;
@end

@implementation MyPublishTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.statusLb];
        [self.contentView addSubview:self.numberLb];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.closeBtn];

        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.statusLb.mas_left).offset(-10);
    }];
    [self.statusLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
    }];
    [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_left);
        make.centerY.equalTo(self.dateLabel);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

- (void)sendDelete
{
    NSDictionary *para = @{@"activityId":self.mypublishdetModel.activityId};
    [[[NetWork sharedManager] request_CloseMyPublish:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            self.statusLb.text = @"已结束";
            self.closeBtn.hidden = YES;
            self.mypublishdetModel.is_finish = @1;
            [self.delegate closeActivity:self.mypublishdetModel androw:self.row];
        }
    }];
}

- (void)setCellData:(MyPublishDetModel *)mypublishModel androw:(NSInteger)row
{
    self.mypublishdetModel = mypublishModel;
    if (!self.mypublishdetModel) {
        return;
    }
    self.row = row;
    self.numberLb.text = [NSString stringWithFormat:@"已有%zd人参加", [self.mypublishdetModel.personNumberIn integerValue]];
    self.contentLabel.text = self.mypublishdetModel.desc;
    self.dateLabel.text = self.mypublishdetModel.meetTime;
    if ([self.mypublishdetModel.is_finish boolValue] == YES) {
        self.statusLb.text = @"已结束";
        self.closeBtn.hidden = YES;
    } else {
        self.statusLb.text = @"正在进行";
        self.closeBtn.hidden = NO;
    }
}


-(UILabel *)statusLb
{
    if (_statusLb == nil) {
        _statusLb = [[UILabel alloc] init];
        _statusLb.font = [UIFont systemFontOfSize:14];
    }
    return _statusLb;
}

-(UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _contentLabel;
}

-(UILabel *)dateLabel
{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = [UIFont systemFontOfSize:14];
    }
    return _dateLabel;
}

-(UILabel *)numberLb
{
    if (_numberLb == nil) {
        _numberLb = [[UILabel alloc] init];
        _numberLb.textColor = GrayColor;
        _numberLb.font = [UIFont systemFontOfSize:13];
    }
    return _numberLb;
}

-(UIButton *)closeBtn
{
    if (_closeBtn == nil) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_closeBtn setTitle:@"关闭活动" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:RedColor forState:UIControlStateNormal];
        [[_closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendDelete];
        }];
    }
    return _closeBtn;
}
@end
