//
//  TypeViewController.m
//  NotLonely
//
//  Created by tesths on 10/23/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "TypeViewController.h"
#import "SquareTableViewCell.h"

#import "DetSquareViewController.h"

@interface TypeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *typeTableView;
@end

@implementation TypeViewController
static NSString *CellIdentifier =@"SquareTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.typeTableView];
    
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.typeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(self.view);
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
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareTableViewCell *cell = [self.typeTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetSquareViewController *detVC = [[DetSquareViewController alloc] init];
    [self.navigationController pushViewController:detVC animated:YES];
}

@end
