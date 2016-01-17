//
//  RegisterViewController.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "RegisterViewController.h"
#import "NATextField.h"
#import "NAButton.h"
#import "DetInfViewController.h"
@interface RegisterViewController ()
@property (strong, nonatomic) TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) UIView *backscrollView;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) NATextField *numberTextField;
@property (strong, nonatomic) NATextField *pswTextField;
@property (strong, nonatomic) NATextField *userTextField;
@property (strong, nonatomic) NATextField *userPswTextField;

@property (strong, nonatomic) UIButton *backBtn;

@property (strong, nonatomic) NAButton *registerBtn;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    self.view.backgroundColor = WhiteColor;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.backscrollView];
    
    [self.backscrollView addSubview:self.titleLabel];
    
    [self.backscrollView addSubview:self.numberTextField];
    [self.backscrollView addSubview:self.pswTextField];
    [self.backscrollView addSubview:self.userTextField];
    [self.backscrollView addSubview:self.userPswTextField];
    
    [self.backscrollView addSubview:self.backBtn];
    
    [self.backscrollView addSubview:self.registerBtn];
    
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backscrollView.mas_top).offset(60);
        make.centerX.equalTo(self.backscrollView);
    }];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.centerX.equalTo(self.backscrollView);
        make.left.equalTo(self.backscrollView.mas_left).offset(40);
        make.right.equalTo(self.backscrollView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.pswTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.backscrollView);
        make.left.equalTo(self.backscrollView.mas_left).offset(40);
        make.right.equalTo(self.backscrollView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pswTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.backscrollView);
        make.left.equalTo(self.backscrollView.mas_left).offset(40);
        make.right.equalTo(self.backscrollView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.userPswTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.backscrollView);
        make.left.equalTo(self.backscrollView.mas_left).offset(40);
        make.right.equalTo(self.backscrollView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.userPswTextField.mas_right);
        make.top.equalTo(self.userPswTextField.mas_bottom);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPswTextField.mas_bottom).offset(50);
        make.centerX.equalTo(self.backscrollView);
        make.left.equalTo(self.backscrollView.mas_left).offset(40);
        make.right.equalTo(self.backscrollView.mas_right).offset(-40);
        make.height.equalTo(@38);
    }];
}

- (void)sendRegister
{
    if (self.numberTextField.text.length < 6 ||
        self.pswTextField.text.length < 6 ||
        self.userTextField.text.length < 6 ||
        self.userPswTextField.text.length < 6 ||
        self.userPswTextField.text.length < 6) {
        [self showHudTipStr:@"格式不正确~"];
        return;
    }
    
    NSDictionary *para = @{@"stu_number":self.numberTextField.text,
                           @"stu_password":self.pswTextField.text,
                           @"username":self.userTextField.text,
                           @"password":self.userPswTextField.text,
                           @"repassword":self.userPswTextField.text,
                           @"sex":@"1",
                           @"nickname":@"1",
                           @"qq":@"1"
                           };
    [[[NetWork sharedManager] request_Register:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            DetInfViewController *detinfVC = [[DetInfViewController alloc] init];
            [self.navigationController pushViewController:detinfVC animated:YES];
        }
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(TPKeyboardAvoidingScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[TPKeyboardAvoidingScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(self.view.GetWidth, self.view.GetHeight);
    }
    return _scrollView;
}

-(UIView *)backscrollView
{
    if (_backscrollView == nil) {
        _backscrollView = [[UIView alloc] init];
        _backscrollView.frame = CGRectMake(0, 0, self.view.GetWidth, self.view.GetHeight);
    }
    return _backscrollView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"注册你的Not Lonely😘";
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

-(NATextField *)numberTextField
{
    if (_numberTextField == nil) {
        _numberTextField = [[NATextField alloc] init];
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _numberTextField.placeholder = @"学号(方便我们实名认证哦~)";
    }
    return _numberTextField;
}

-(NATextField *)pswTextField
{
    if (_pswTextField == nil) {
        _pswTextField = [[NATextField alloc] init];
        _pswTextField.secureTextEntry = YES;
        _pswTextField.placeholder = @"密码(信息门户密码能让我们实名认证~)";
    }
    return _pswTextField;
}

-(NATextField *)userTextField
{
    if (_userTextField == nil) {
        _userTextField = [[NATextField alloc] init];
        _userTextField.placeholder = @"登录用户名(用于登录的用户名~)";
    }
    return _userTextField;
}

-(NATextField *)userPswTextField
{
    if (_userPswTextField == nil) {
        _userPswTextField = [[NATextField alloc] init];
        _userPswTextField.secureTextEntry = YES;
        _userPswTextField.placeholder = @"密码(登录密码，不能少于6位数哦~)";
    }
    return _userPswTextField;
}

-(UIButton *)backBtn
{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:GrayColor forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [[_backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            UIAlertView *backAlert = [[UIAlertView alloc] initWithTitle:@"注册" message:@"确定放弃注册返回主界面" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [backAlert show];
            [[backAlert rac_buttonClickedSignal] subscribeNext:^(id x) {
                if ([x integerValue] == 0) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
        }];
    }
    return _backBtn;
}

-(NAButton *)registerBtn
{
    if (_registerBtn == nil) {
        _registerBtn = [NAButton buttonWithType:UIButtonTypeSystem];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_registerBtn setTitle:@"注  册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:BlackColor];
        [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendRegister];
        }];
    }
    return _registerBtn;
}

@end
