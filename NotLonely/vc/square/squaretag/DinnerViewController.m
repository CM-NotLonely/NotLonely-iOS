//
//  DinnerViewController.m
//  NotLonely
//
//  Created by tesths on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DinnerViewController.h"

#import "SquareTableViewCell.h"
#import "DetSquareViewController.h"

#import "SquareModel.h"
@interface DinnerViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *typeTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) BlackODRefreshControl *refreshControl;
@end

@implementation DinnerViewController
static NSString *CellIdentifier =@"SquareTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray new];
    [self.view addSubview:self.typeTableView];
    self.refreshControl = [[BlackODRefreshControl alloc] initInScrollView:self.typeTableView];
    [self.refreshControl beginRefreshing];
    [self.refreshControl addTarget:self action:@selector(sendSquare) forControlEvents:UIControlEventValueChanged];
    [self setUpConstraint];
    [self sendSquare];
}

- (void)setUpConstraint
{
    [self.typeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-49);
    }];
}

- (void)sendSquare
{
    NSDictionary *para = @{@"tag":@"约饭"};
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_Square:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(SquareModel *data) = x;
        [CustomHud hideHUDForView:self.view animated:YES];
        [self.refreshControl endRefreshing];
        if (data) {
            self.dataArray = data.items;
            [self.typeTableView reloadData];
        }
    }];
}

-(UITableView *)typeTableView
{
    if (_typeTableView == nil) {
        _typeTableView = [[UITableView alloc] init];
        _typeTableView.delegate = self;
        _typeTableView.dataSource = self;
        _typeTableView.separatorColor = ClearColor;
        [_typeTableView registerClass:[SquareTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    }
    return _typeTableView;
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
    SquareTableViewCell *cell = [self.typeTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setCellData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetSquareViewController *detVC = [[DetSquareViewController alloc] init];
    detVC.squaredetModel = [self.dataArray objectAtIndex:indexPath.row];
    detVC.tag = @"运动🏀";
    [self.navigationController pushViewController:detVC animated:YES];
}


@end
