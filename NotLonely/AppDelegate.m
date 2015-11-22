//
//  AppDelegate.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "AppDelegate.h"

#import "LoginViewController.h"

#import "MyPublishViewController.h"
#import "SquareViewController.h"
#import "MyReceiveViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

//    [self setupLoginViewController];
    [self setupRootViewController];
    return YES;
}

- (void)setupLoginViewController
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
}

- (void)setupRootViewController
{
    UITabBarController *tabViewController = [[UITabBarController alloc] init];
    
    MyPublishViewController *mypublshVC = [[MyPublishViewController alloc] init];
    NNViewController *mypublshNavigationController = [[NNViewController alloc] initWithRootViewController:mypublshVC];

    mypublshNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的发布" image:[UIImage imageNamed:@"ic_mypublish"] tag:0];
    
    SquareViewController *squareVC = [[SquareViewController alloc] init];
    NNViewController *squareNavigationController = [[NNViewController alloc] initWithRootViewController:squareVC];
    squareNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"广场" image:[UIImage imageNamed:@"ic_square"] tag:1];
    
    MyReceiveViewController *myreceiveVC = [[MyReceiveViewController alloc] init];
    NNViewController *myreceiveNavigationController = [[NNViewController alloc] initWithRootViewController:myreceiveVC];
    myreceiveNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我参与的" image:[UIImage imageNamed:@"ic_myrecieve"] tag:1];
    
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    NNViewController *settingNavigationController = [[NNViewController alloc] initWithRootViewController:settingVC];
    settingNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"ic_setting"] tag:1];
    
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    tabViewController.viewControllers = @[mypublshNavigationController, squareNavigationController, myreceiveNavigationController, settingNavigationController];
    
    
    self.window.rootViewController = tabViewController;
}

@end
