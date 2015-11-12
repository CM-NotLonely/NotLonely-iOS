//
//  SquareViewController.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "SquareViewController.h"
#import "TypeViewController.h"
#import "AddNaViewController.h"
#import "NNViewController.h"

#import "SportsViewController.h"
#import "DinnerViewController.h"
#import "StudyViewController.h"
#import "MovieViewController.h"

@interface SquareViewController ()<AddNaViewControllerControllerDelegate>
@property (strong, nonatomic) SportsViewController *sportsVC;
@property (strong, nonatomic) DinnerViewController *dinnerVC;
@property (strong, nonatomic) StudyViewController *studyVC;
@property (strong, nonatomic) MovieViewController *movieVC;

@end

@implementation SquareViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"广场";
        
        self.sportsVC = [[SportsViewController alloc]init];
        self.dinnerVC = [[DinnerViewController alloc]init];
        self.studyVC = [[StudyViewController alloc]init];
        self.movieVC = [[MovieViewController alloc]init];

        self.sportsVC.title = @"运动🏀";
        self.dinnerVC.title = @"约饭🍞";
        self.studyVC.title = @"学习📝";
        self.movieVC.title = @"电影👫";
        
        NSArray *viewControllers = @[self.sportsVC, self.dinnerVC, self.studyVC, self.movieVC];
        self.viewControllers = viewControllers;
        
        [self setupNavigationBar];
    }
    return self;
}

- (void)setupNavigationBar
{
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"img_add"] style:UIBarButtonItemStylePlain target:self action:@selector(addNA)];
    [self.navigationItem setRightBarButtonItem:rightbtn];
}

- (void)addNA
{
    AddNaViewController *addNAVC = [[AddNaViewController alloc] init];
    addNAVC.delegate = self;
    NNViewController *addNANavigationController = [[NNViewController alloc] initWithRootViewController:addNAVC];
    [self presentViewController:addNANavigationController animated:YES completion:nil];
}

-(void)refreshList
{
    [self.sportsVC sendSquare];
}
@end
