//
//  RegisterViewController.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetInfViewController.h"
#import "NATextField.h"
#import "NAButton.h"
#import "NNScrollView.h"

@interface DetInfViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) NNScrollView *scrollView;

@property (strong, nonatomic) UIImageView *headImg;
@property (strong, nonatomic) UILabel *headLb;

@property (strong, nonatomic) NATextField *userTextField;
@property (strong, nonatomic) NATextField *phoneTextField;
@property (strong, nonatomic) NATextField *tagTextField;

@property (strong, nonatomic) UILabel *sexLabel;
@property (strong, nonatomic) NSString *sexStr;
@property (strong, nonatomic) UISegmentedControl *sexSegmentedControl;

@property (strong, nonatomic) NAButton *defineBtn;
@property (strong, nonatomic) UIButton *moreBtn;
@end

@implementation DetInfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详细信息";
    self.view.backgroundColor = WhiteColor;
    self.navigationItem.hidesBackButton = YES;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    self.sexStr = @"男";
    [self.view addSubview:self.scrollView];
    
    [self.scrollView.contentView addSubview:self.headImg];
    [self.scrollView.contentView addSubview:self.headLb];
    
    [self.scrollView.contentView addSubview:self.userTextField];
    [self.scrollView.contentView addSubview:self.sexLabel];
    [self.scrollView.contentView addSubview:self.sexSegmentedControl];
    
    [self.scrollView.contentView addSubview:self.phoneTextField];
    [self.scrollView.contentView addSubview:self.tagTextField];
    
    [self.scrollView.contentView addSubview:self.defineBtn];
    
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView.contentView);
        make.top.equalTo(self.scrollView.contentView.mas_top).offset(40);
        make.width.height.equalTo(@70);
    }];
    [self.headLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView.contentView);
        make.top.equalTo(self.headImg.mas_bottom).offset(10);
    }];
    
    [self.userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headLb.mas_bottom).offset(20);
        make.centerX.equalTo(self.scrollView.contentView);
        make.left.equalTo(self.scrollView.contentView.mas_left).offset(40);
        make.right.equalTo(self.scrollView.contentView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userTextField.mas_bottom).offset(25);
        make.left.equalTo(self.scrollView.contentView.mas_left).offset(40);
    }];
    [self.sexSegmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sexLabel);
        make.left.equalTo(self.sexLabel.mas_right).offset(20);
        make.width.equalTo(@120);
    }];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sexSegmentedControl.mas_bottom).offset(20);
        make.centerX.equalTo(self.scrollView.contentView);
        make.left.equalTo(self.scrollView.contentView.mas_left).offset(40);
        make.right.equalTo(self.scrollView.contentView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.tagTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.scrollView.contentView);
        make.left.equalTo(self.scrollView.contentView.mas_left).offset(40);
        make.right.equalTo(self.scrollView.contentView.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    
    [self.defineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagTextField.mas_bottom).offset(50);
        make.centerX.equalTo(self.scrollView.contentView);
        make.left.equalTo(self.scrollView.contentView.mas_left).offset(40);
        make.right.equalTo(self.scrollView.contentView.mas_right).offset(-40);
        make.height.equalTo(@38);
    }];
}

- (void)uploadImg:(NSURL *)filePath
{
    [[[NetWork sharedManager] UploadPic:filePath] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            [NNUserData setDefaultValue:data withKey:user_avatar];
        }
    } completed:^{
        
    }];
}

- (void)sendDetInf
{
    if (self.userTextField.text.length < 6 ||
        self.tagTextField.text.length < 6 ||
        self.phoneTextField.text.length < 6) {
        [self showHudTipStr:@"格式不正确~"];
        return;
    }
    
    NSDictionary *para = @{@"nickname":self.userTextField.text,
                           @"sex":self.sexStr,
                           @"desc":self.tagTextField.text,
                           @"qq":self.phoneTextField.text
                           };
    [[[NetWork sharedManager] request_DetInf:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    NSData *imgData = UIImageJPEGRepresentation(image, 0.0001);
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

-(NNScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[NNScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.GetWidth, self.view.GetHeight)];
        _scrollView.contentSize = CGSizeMake(self.view.GetWidth, self.view.GetHeight);
    }
    return _scrollView;
}

-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc] init];
        _headImg.image = [UIImage imageNamed:@"head_placeholder"];
        _headImg.layer.cornerRadius = 35;
        _headImg.layer.masksToBounds = YES;
        _headImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap.rac_gestureSignal subscribeNext:^(id x) {
            [self chooseImg];
        }];
        [_headImg addGestureRecognizer:tap];
    }
    return _headImg;
}

-(UILabel *)headLb
{
    if (_headLb == nil) {
        _headLb = [[UILabel alloc] init];
        _headLb.text = @"头像";
        _headLb.font = [UIFont systemFontOfSize:15];
    }
    return _headLb;
}

-(UILabel *)sexLabel
{
    if (_sexLabel == nil) {
        _sexLabel = [[UILabel alloc] init];
        _sexLabel.text = @"性别";
        _sexLabel.font = [UIFont systemFontOfSize:14];
    }
    return _sexLabel;
}

-(UISegmentedControl *)sexSegmentedControl
{
    if (_sexSegmentedControl == nil) {
        NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"男",@"女", nil];
        _sexSegmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedArray];
        _sexSegmentedControl.tintColor = BlackColor;
        _sexSegmentedControl.selectedSegmentIndex = 0;
        [[_sexSegmentedControl rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
            if (_sexSegmentedControl.selectedSegmentIndex == 0) {
                self.sexStr = @"男";
            }
            if (_sexSegmentedControl.selectedSegmentIndex == 1) {
                self.sexStr = @"女";
            }
        }];
    }
    return _sexSegmentedControl;
}

-(NATextField *)userTextField
{
    if (_userTextField == nil) {
        _userTextField = [[NATextField alloc] init];
        _userTextField.placeholder = @"用户名(个性化的用户名，让你更受欢迎!)";
    }
    return _userTextField;
}

-(NATextField *)phoneTextField
{
    if (_phoneTextField == nil) {
        _phoneTextField = [[NATextField alloc] init];
        _phoneTextField.placeholder = @"电话(真实电话，方便约后联系~)";
    }
    return _phoneTextField;
}

-(NATextField *)tagTextField
{
    if (_tagTextField == nil) {
        _tagTextField = [[NATextField alloc] init];
        _tagTextField.placeholder = @"标签(一句话描述你自己，让别人更好认识你~)";
    }
    return _tagTextField;
}

-(NAButton *)defineBtn
{
    if (_defineBtn == nil) {
        _defineBtn = [NAButton buttonWithType:UIButtonTypeSystem];
        _defineBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_defineBtn setTitle:@"确  认" forState:UIControlStateNormal];
        [_defineBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_defineBtn setBackgroundColor:BlackColor];
        [[_defineBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendDetInf];
        }];
    }
    return _defineBtn;
}

@end
