//
//  NNViewController.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "NNViewController.h"

@interface NNViewController ()

@end

@implementation NNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:BlackColor];//设置navigationbar的颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];//设置navigationbar上左右按钮字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationBar setTranslucent:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
