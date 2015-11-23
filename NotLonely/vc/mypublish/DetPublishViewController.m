//
//  DetPublishViewController.m
//  NotLonely
//
//  Created by tesths on 11/6/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetPublishViewController.h"
#import "DetPublishTableViewCell.h"
#import "PeopleDetInfViewController.h"

#import "DetPublishModel.h"
#import "DetPublishDetModel.h"

@interface DetPublishViewController () <UITableViewDelegate, UITableViewDataSource, DetPublishTableViewCellDelegate>
@property (nonatomic, strong) UITableView *detpublishTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BlackODRefreshControl *refreshControl;
@end

@implementation DetPublishViewController
static NSString *CellIdentifier =@"DetPublishTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NA列表";
    self.dataArray = [NSMutableArray new];
    [self.view addSubview:self.detpublishTableView];
    self.refreshControl = [[BlackODRefreshControl alloc] initInScrollView:self.detpublishTableView];
    [self.refreshControl addTarget:self action:@selector(sendPeopleList) forControlEvents:UIControlEventValueChanged];
    [self setUpConstraint];
    [self sendPeopleList];
}

- (void)setUpConstraint
{
    [self.detpublishTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(self.view);
    }];
}

-(void)sendPeopleList
{
    NSDictionary *para = @{@"activityId":self.activityId};
    if ([self.type integerValue] == 0) {
        [[[NetWork sharedManager] request_DetMyPublish:para] subscribeNext:^(RACTuple *x) {
            RACTupleUnpack(DetPublishModel *data) = x;
            [self.refreshControl endRefreshing];
            if (data) {
                self.dataArray = data.relationList;
                [self.detpublishTableView reloadData];
            }
        }];
    } else {
        [[[NetWork sharedManager] request_OtherMyPublish:para] subscribeNext:^(RACTuple *x) {
            RACTupleUnpack(DetPublishModel *data) = x;
            [self.refreshControl endRefreshing];
            if (data) {
                self.dataArray = data.relationList;
                if (data.initiator != nil) {
                    [self.dataArray insertObject:data.initiator atIndex:0];
                }
                
                [self.detpublishTableView reloadData];
            }
        }];
    }

}

- (DetPublishDetModel *)configureModelatIndex:(NSUInteger)row
{
    return [self.dataArray objectAtIndex:row];
}

-(void)peopleList
{
    
}

-(UITableView *)detpublishTableView
{
    if (_detpublishTableView == nil) {
        _detpublishTableView = [[UITableView alloc] init];
        _detpublishTableView.delegate = self;
        _detpublishTableView.dataSource = self;
        _detpublishTableView.tableFooterView = [[UIView alloc] init];
        [_detpublishTableView registerClass:[DetPublishTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    }
    return _detpublishTableView;
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
    DetPublishTableViewCell *cell = [self.detpublishTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.delegate = self;
    cell.activityId = self.activityId;
    [cell setCellData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PeopleDetInfViewController *peopledetinfVC = [[PeopleDetInfViewController alloc] init];
    peopledetinfVC.is_finish = self.is_finish;
    peopledetinfVC.detpublishdetModel = [self configureModelatIndex:indexPath.row];
    peopledetinfVC.activityId = self.activityId;
    [self.navigationController pushViewController:peopledetinfVC animated:YES];
}
@end
