//
//  SettingViewController.m
//  NotLonely
//
//  Created by tesths on 10/9/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) UILabel *headLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *pushLabel;
@property (strong, nonatomic) UILabel *phoneLabel;

@property (strong, nonatomic) UIImageView *headImg;
@property (strong, nonatomic) UILabel *usernameLabel;
@property (strong, nonatomic) UILabel *phonenumLabel;
@property (strong, nonatomic) UISwitch *pushSwitch;

@property (strong, nonatomic) UIButton *logoutBtn;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    
    [self.view addSubview:self.headLabel];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.phoneLabel];
    
    [self.view addSubview:self.headImg];
    [self.view addSubview:self.usernameLabel];
    [self.view addSubview:self.phonenumLabel];
    
    [self.view addSubview:self.logoutBtn];

    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.top.equalTo(self.view.mas_top).offset(30);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headLabel.mas_left);
        make.top.equalTo(self.headLabel.mas_bottom).offset(30);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headLabel.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(30);
    }];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headLabel);
        make.width.height.equalTo(@40);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.centerX.equalTo(self.headImg);
    }];
    [self.phonenumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneLabel);
        make.centerX.equalTo(self.headImg);
    }];
    
    [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phonenumLabel.mas_bottom).offset(50);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.equalTo(@38);
    }];
}

- (void)uploadImg:(NSURL *)filePath
{
    [[[NetWork sharedManager] UploadPic:filePath] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            [NNUserData setDefaultValue:[NSString stringWithFormat:@"%@%@", BASE_URL, [data objectForKey:@"headImg"]] withKey:user_avatar];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } completed:^{
        
    }];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    NSData *imgData = UIImagePNGRepresentation(image);
    self.headImg.image = image;
    [imgData writeToFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"head%d.png", 1]] atomically:YES];
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"head%d.png", 1]];
    NSURL *filePath = [NSURL fileURLWithPath:path];
    NSLog(@"%@", filePath);
    [self uploadImg:filePath];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)chooseImg
{
    UIActionSheet *chooseAlert = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从手机相册选择", @"拍照", nil];
    [chooseAlert showInView:self.view];
    
    [[chooseAlert rac_buttonClickedSignal] subscribeNext:^(NSNumber *indexNumber) {
        if ([indexNumber intValue] == 1) {
            [self chooseFromCamera];
        } else if ([indexNumber intValue] == 0){
            [self chooseFromAlbum];
        }
    }];
}

- (void)chooseFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请设置支持拍照功能" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)chooseFromAlbum
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}


-(UILabel *)headLabel
{
    if (_headLabel == nil) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.text = @"头像";
        _headLabel.font = [UIFont systemFontOfSize:14];
    }
    return _headLabel;
}

-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"用户名";
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

-(UILabel *)phoneLabel
{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.text = @"电话";
        _phoneLabel.font = [UIFont systemFontOfSize:14];
    }
    return _phoneLabel;
}

-(UILabel *)phonenumLabel
{
    if (_phonenumLabel == nil) {
        _phonenumLabel = [[UILabel alloc] init];
        _phonenumLabel.text = NNGetUserData(user_phone);
        _phonenumLabel.font = [UIFont systemFontOfSize:14];
    }
    return _phonenumLabel;
}

-(UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.font = [UIFont systemFontOfSize:14];
        NSLog(@"%@", NNGetUserData(user_username));
        _usernameLabel.text = NNGetUserData(user_username);
    }
    return _usernameLabel;
}

-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc] init];
        _headImg.layer.cornerRadius = 20;
        _headImg.layer.masksToBounds = YES;
        _headImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap.rac_gestureSignal subscribeNext:^(id x) {
            [self chooseImg];
        }];
        [_headImg addGestureRecognizer:tap];
        NSLog(@"%@", NNGetUserData(user_avatar));
        [_headImg setImageWithURL:[NSURL URLWithString:NNGetUserData(user_avatar)] placeholderImage:[UIImage imageNamed:@"head_placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _headImg;
}

-(UIButton *)logoutBtn
{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_logoutBtn setBackgroundColor:BlackColor];
        [[_logoutBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [((AppDelegate *)[UIApplication sharedApplication].delegate) setupLoginViewController];
            [NNUserData setDefaultValue:@"0" withKey:is_login];
        }];
    }
    return _logoutBtn;
}

@end
