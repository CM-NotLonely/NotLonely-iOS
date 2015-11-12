//
//  PeopleDetInfViewController.m
//  NotLonely
//
//  Created by  plusub on 11/7/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "PeopleDetInfViewController.h"
#import "LoginModel.h"
#import <SKTagView/SKTagView.h>

@interface PeopleDetInfViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) NSString *commentStr;
@property (weak, nonatomic) IBOutlet UITextView *tagTextView;

- (IBAction)sendComment:(id)sender;

@end

@implementation PeopleDetInfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.detpublishdetModel.personInNickname;
    // Do any additional setup after loading the view from its nib.

    [self.headImg setImageWithURL:self.detpublishdetModel.personInAvatar placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
    self.nameLabel.text = self.detpublishdetModel.personInNickname;
    self.sexLabel.text = self.detpublishdetModel.sex;
    self.contentLabel.text = self.detpublishdetModel.desc;
    
//    self.tagTextView.text = [self.detpublishdetModel.tag componentsJoinedByString:@","];
    
    if ([self.detpublishdetModel.relationDeal boolValue]) {
        [self sendPhone];
    }
}

- (void)sendPhone
{
    NSDictionary *para = @{@"activityId":self.activityId,
                           @"personInId":self.detpublishdetModel.personInId};
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_MPhone:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(NSString *data) = x;
        [CustomHud hideHUDForView:self.view animated:YES];
        if (data) {
            self.phoneLabel.text = [NSString stringWithFormat:@"☎️%@", data];
        }
    }];
}

- (void)sendComment
{
    NSDictionary *para = @{@"activityId":self.activityId,
                           @"beCommittedId":self.detpublishdetModel.personInId,
                           @"tag":self.commentStr,
                           @"giveRose":@0};
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_Comment:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        [CustomHud hideHUDForView:self.view animated:YES];
        if (data) {
            [self sendGetInf];
        }
    }];
}

- (void)sendGetInf
{
    NSDictionary *para = @{@"userId":self.detpublishdetModel.personInId};
    [[[NetWork sharedManager] request_Inf:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(LoginModel *data) = x;
        if (data) {
            self.tagTextView.text = [data.tag componentsJoinedByString:@","];
        }
    }];
}

- (IBAction)sendComment:(id)sender
{
    UIAlertView *commentAlert = [[UIAlertView alloc] initWithTitle:@"来评论~" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [commentAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [commentAlert show];
    
    UITextField *commentTextField = [commentAlert textFieldAtIndex:0];
    commentTextField.placeholder = @"请输入你的评论~";
    
    [[commentAlert rac_buttonClickedSignal] subscribeNext:^(id x) {
        if ([x integerValue] == 1) {
            self.commentStr = [commentAlert textFieldAtIndex:0].text;
            [self sendComment];
        }
        
    }];
}
@end
