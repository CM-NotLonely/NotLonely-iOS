//
//  LoginViewController.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

#import "NAButton.h"
#import "NATextField.h"

#import "LoginModel.h"

@interface LoginViewController ()
@property (strong, nonatomic) UIImageView *logoImg;
@property (strong, nonatomic) UILabel *nameLb;

@property (strong, nonatomic) UIButton *registerBtn;

@property (strong, nonatomic) NATextField *userTextField;
@property (strong, nonatomic) NATextField *pswTextField;

@property (strong, nonatomic) NAButton *loginBtn;
@property (strong, nonatomic) UIButton *moreBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WhiteColor;
    
    [self.view addSubview:self.logoImg];
    [self.view addSubview:self.nameLb];
    
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.pswTextField];
    
    [self.view addSubview:self.registerBtn];
    
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.moreBtn];
    
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(70);
        make.width.height.equalTo(@80);
    }];
    [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logoImg.mas_bottom).offset(10);
    }];
    
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLb.mas_bottom).offset(40);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.pswTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.pswTextField.mas_right);
        make.top.equalTo(self.pswTextField.mas_bottom);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pswTextField.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@38);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.centerX.equalTo(self.view);
    }];
}

- (void)sendLogin
{
    NSDictionary *para = @{@"username":self.userTextField.text,
                           @"password":self.pswTextField.text};
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_Login:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(LoginModel *data) = x;
        if (data) {
            [((AppDelegate *)[UIApplication sharedApplication].delegate) setupRootViewController];
            [NNUserData setDefaultValue:data.username withKey:user_username];
            [NNUserData setDefaultValue:data.nickname withKey:user_nickname];
            [NNUserData setDefaultValue:data.avatar withKey:user_avatar];
            [NNUserData setDefaultValue:data.phone withKey:user_phone];
            [NNUserData setDefaultValue:data.sex withKey:user_sex];
        }
    }];
    [CustomHud hideHUDForView:self.view animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(UIImageView *)logoImg
{
    if (_logoImg == nil) {
        _logoImg = [[UIImageView alloc] init];
        _logoImg.image = [UIImage imageNamed:@"logo-original"];
        _logoImg.layer.cornerRadius = 10;
        _logoImg.layer.masksToBounds = YES;
    }
    return _logoImg;
}

-(UILabel *)nameLb
{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.text = @"Not Lonely";
        _nameLb.font = [UIFont systemFontOfSize:16];
    }
    return _nameLb;
}

-(NATextField *)userTextField
{
    if (_userTextField == nil) {
        _userTextField = [[NATextField alloc] init];
        _userTextField.placeholder = @"用户名";
    }
    return _userTextField;
}

-(NATextField *)pswTextField
{
    if (_pswTextField == nil) {
        _pswTextField = [[NATextField alloc] init];
        _pswTextField.placeholder = @"密码";
        _pswTextField.secureTextEntry = YES;
    }
    return _pswTextField;
}

-(UIButton *)registerBtn
{
    if (_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:GrayColor forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            RegisterViewController *registerVC = [[RegisterViewController alloc] init];
            NNViewController *registerNavi = [[NNViewController alloc] initWithRootViewController:registerVC];
            [self presentViewController:registerNavi animated:YES completion:nil];
        }];
    }
    return _registerBtn;
}

-(NAButton *)loginBtn
{
    if (_loginBtn == nil) {
        _loginBtn = [NAButton buttonWithType:UIButtonTypeSystem];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:BlackColor];
        [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendLogin];
        }];
    }
    return _loginBtn;
}

-(UIButton *)moreBtn
{
    if (_moreBtn == nil) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:BlackColor forState:UIControlStateNormal];
    }
    return _moreBtn;
}
@end
