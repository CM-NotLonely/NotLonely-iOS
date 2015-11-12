//
//  MyReceiveViewController.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "MyReceiveViewController.h"
#import "MyReceiveTableViewCell.h"

#import "PeopleDetInfViewController.h"
#import "DetPublishViewController.h"

#import "MyReceiveModel.h"
#import "MyReceiveDetModel.h"
@interface MyReceiveViewController ()<UITableViewDelegate, UITableViewDataSource, MyReceiveTableViewCellDelegate>
@property (nonatomic, strong) UITableView *myreceiveTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BlackODRefreshControl *refreshControl;
@end

@implementation MyReceiveViewController
static NSString *CellIdentifier =@"MyReceiveTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我参与的";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.myreceiveTableView];
    self.dataArray = [NSMutableArray new];
    self.refreshControl = [[BlackODRefreshControl alloc] initInScrollView:self.myreceiveTableView];
    [self.refreshControl addTarget:self action:@selector(sendMyRecieve) forControlEvents:UIControlEventValueChanged];
    [self setUpConstraint];
    [self sendMyRecieve];
}

-(void)sendMyRecieve
{
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_MyRequest:nil] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(MyReceiveModel *data) = x;
        [CustomHud hideHUDForView:self.view animated:YES];
        [self.refreshControl endRefreshing];
        if (data) {
            self.dataArray = data.myRequestList;
            [self.myreceiveTableView reloadData];
        }
    }];
}

- (MyReceiveDetModel *)configureModelatIndex:(NSUInteger)row
{
    return [self.dataArray objectAtIndex:row];
}

- (void)setUpConstraint
{
    [self.myreceiveTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(self.view);
    }];
}

-(UITableView *)myreceiveTableView
{
    if (_myreceiveTableView == nil) {
        _myreceiveTableView = [[UITableView alloc] init];
        _myreceiveTableView.delegate = self;
        _myreceiveTableView.dataSource = self;
        _myreceiveTableView.separatorColor = ClearColor;
        [_myreceiveTableView registerClass:[MyReceiveTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    }
    return _myreceiveTableView;
}

-(void)peopleDetInf
{
    PeopleDetInfViewController *peopledetinfVC = [[PeopleDetInfViewController alloc] init];
    [self.navigationController pushViewController:peopledetinfVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyReceiveTableViewCell *cell = [self.myreceiveTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.delegate = self;
    [cell setCellData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if ([self configureModelatIndex:indexPath.row].relationDeal) {
        DetPublishViewController *detVC = [[DetPublishViewController alloc] init];
        detVC.activityId = [self configureModelatIndex:indexPath.row].activityId;
        detVC.is_finish = [self configureModelatIndex:indexPath.row].is_finish;
        detVC.type = @1;
        [self.navigationController pushViewController:detVC animated:YES];
    }
}

@end
