//
//  MyPublishViewController.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyPublishViewController.h"
#import "MyPublishTBHeader.h"
#import "MyPublishTableViewCell.h"

#import "DetPublishViewController.h"
#import "MyPublishModel.h"
#import "MyPublishDetModel.h"

@interface MyPublishViewController () <UITableViewDelegate, UITableViewDataSource, MyPublishTableViewCellDelegate>
@property (nonatomic, strong) UITableView *mypublishTableView;
@property (nonatomic, strong) MyPublishTBHeader *mypublishTBHeader;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BlackODRefreshControl *refreshControl;
@end

@implementation MyPublishViewController
static NSString *CellIdentifier =@"MyPublishTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的发布";
    self.dataArray = [NSMutableArray new];
    [self.view addSubview:self.mypublishTableView];
    self.refreshControl = [[BlackODRefreshControl alloc] initInScrollView:self.mypublishTableView];
    [self.refreshControl addTarget:self action:@selector(sendMyPost) forControlEvents:UIControlEventValueChanged];
    [self setUpConstraint];
    [self sendMyPost];
}

- (void)setUpConstraint
{
    [self.mypublishTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top);
    }];
}

- (void)sendMyPost
{
    [[[NetWork sharedManager] request_MyPublish:nil] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(MyPublishModel *data) = x;
        [self.refreshControl endRefreshing];
        if (data) {
            self.dataArray = data.myPostList;
            [self.mypublishTableView reloadData];
        }
    }];
}

-(void)closeActivity:(MyPublishDetModel *)model androw:(NSInteger)row
{
    self.dataArray[row] = model;
}

- (MyPublishDetModel *)configureModelatIndex:(NSUInteger)row
{
    return [self.dataArray objectAtIndex:row];
}

-(MyPublishTBHeader *)mypublishTBHeader
{
    if (_mypublishTBHeader == nil) {
        _mypublishTBHeader = [[MyPublishTBHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.GetWidth, 155)];
        [_mypublishTBHeader.headImg setImageWithURL:[NSURL URLWithString:NNGetUserData(user_avatar)] placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _mypublishTBHeader.nameLabel.text = NNGetUserData(user_nickname);
        _mypublishTBHeader.sexLabel.text = NNGetUserData(user_sex);
    }
    return _mypublishTBHeader;
}

-(UITableView *)mypublishTableView
{
    if (_mypublishTableView == nil) {
        _mypublishTableView = [[UITableView alloc] init];
        _mypublishTableView.delegate = self;
        _mypublishTableView.dataSource = self;
        _mypublishTableView.tableHeaderView = self.mypublishTBHeader;
        _mypublishTableView.tableFooterView = [[UIView alloc] init];
        [_mypublishTableView registerClass:[MyPublishTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    }
    return _mypublishTableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyPublishTableViewCell *cell = [self.mypublishTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.delegate = self;
    [cell setCellData:[self.dataArray objectAtIndex:indexPath.row] androw:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetPublishViewController *detVC = [[DetPublishViewController alloc] init];
    detVC.type = @0;
    detVC.activityId = [self configureModelatIndex:indexPath.row].activityId;
    detVC.is_finish = [[self configureModelatIndex:indexPath.row].is_finish boolValue];
    [self.navigationController pushViewController:detVC animated:YES];
}
@end
