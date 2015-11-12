//
//  DetTableViewCell.m
//  NotLonely
//
//  Created by tesths on 11/6/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetPublishTableViewCell.h"

@interface DetPublishTableViewCell ()
@property (strong, nonatomic) UIImageView *headImg;
@property (strong, nonatomic) UILabel *nameLb;
@property (strong, nonatomic) UIButton *agreeBtn;
@property (strong, nonatomic) DetPublishDetModel *detpushlishdetModel;
@end


@implementation DetPublishTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLb];
        [self.contentView addSubview:self.agreeBtn];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.width.height.equalTo(@40);
    }];
    [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImg.mas_right).offset(15);
        make.centerY.equalTo(self.headImg);
    }];
    [self.agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)sendMyConfirm
{
    NSDictionary *para = @{@"activityId":self.activityId,
                           @"personInId":self.detpushlishdetModel.personInId};
    [[[NetWork sharedManager] request_AgreeMyPublish:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            self.agreeBtn.hidden = YES;
        }
    }];
}

- (void)setCellData:(DetPublishDetModel *)detpublishdetModel
{
    self.detpushlishdetModel = detpublishdetModel;
    if (!self.detpushlishdetModel) {
        return;
    }
    [self.headImg setImageWithURL:self.detpushlishdetModel.personInAvatar placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
    self.nameLb.text = self.detpushlishdetModel.personInNickname;
    if ([self.detpushlishdetModel.relationDeal boolValue] || self.detpushlishdetModel.relationDeal == nil) {
        self.agreeBtn.hidden = YES;
    } else {
        self.agreeBtn.hidden = NO;
    }
}

-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc] init];
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 20;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap.rac_gestureSignal subscribeNext:^(id x) {
            [self.delegate peopleList];
        }];
    }
    return _headImg;
}

-(UILabel *)nameLb
{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:14];
    }
    return _nameLb;
}

-(UIButton *)agreeBtn
{
    if (_agreeBtn == nil) {
        _agreeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_agreeBtn setTitle:@"同意" forState:UIControlStateNormal];
        [_agreeBtn setTitleColor:BlueColor forState:UIControlStateNormal];
        [[_agreeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendMyConfirm];
        }];
    }
    return _agreeBtn;
}

@end
