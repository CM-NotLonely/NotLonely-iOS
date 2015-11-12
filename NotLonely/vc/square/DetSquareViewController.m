//
//  DetSquareViewController.m
//  NotLonely
//
//  Created by tesths on 11/6/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "DetSquareViewController.h"
#import "NAFirstTextField.h"
#import "NAButton.h"

@interface DetSquareViewController ()
@property (strong, nonatomic) UILabel *addNALb;

@property (strong, nonatomic) NATextField *nameTextField;
@property (strong, nonatomic) NAFirstTextField *tagTextField;
@property (strong, nonatomic) NAFirstTextField *contentTextField;
@property (strong, nonatomic) NAFirstTextField *numberTextField;
@property (strong, nonatomic) NATextField *timeTextField;
@property (strong, nonatomic) NAFirstTextField *placeTextField;
@property (strong, nonatomic) UILabel *remarkLabel;
@property (strong, nonatomic) UITextView *remarkTextView;
@end

@implementation DetSquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WhiteColor;
    self.title = @"NA细节";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backarrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backSquare)];
    [self.navigationItem setLeftBarButtonItem:leftBtn];
    
    [self.view addSubview:self.addNALb];
    
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.tagTextField];
    [self.view addSubview:self.contentTextField];
    [self.view addSubview:self.numberTextField];
    [self.view addSubview:self.timeTextField];
    [self.view addSubview:self.placeTextField];
    [self.view addSubview:self.remarkLabel];
    [self.view addSubview:self.remarkTextView];
    [self setData];
    
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.addNALb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(40);
    }];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addNALb.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.tagTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.timeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.placeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeTextField.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@30);
    }];
    [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.placeTextField.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(40);
    }];
    [self.remarkTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarkLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@70);
    }];
}

- (void)setData
{
    self.nameTextField.text = self.squaredetModel.title;
    self.tagTextField.text = self.tag;
    self.contentTextField.text = self.squaredetModel.desc;
    self.numberTextField.text = [NSString stringWithFormat:@"一共%@人，现有%@人", self.squaredetModel.personNumberAll, self.squaredetModel.personNumberIn];
    self.timeTextField.text = self.squaredetModel.meetTime;
    self.placeTextField.text = self.squaredetModel.meetPlace;
    self.remarkTextView.text = self.squaredetModel.remark;
}

- (void)backSquare
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(UILabel *)addNALb
{
    if (_addNALb == nil) {
        _addNALb = [[UILabel alloc] init];
        _addNALb.text = @"Not Lonely细节";
        _addNALb.font = [UIFont systemFontOfSize:16];
    }
    return _addNALb;
}

-(NATextField *)nameTextField
{
    if (_nameTextField == nil) {
        _nameTextField = [[NATextField alloc] init];
        _nameTextField.placeholder = @"标题";
    }
    return _nameTextField;
}

-(NAFirstTextField *)tagTextField
{
    if (_tagTextField == nil) {
        _tagTextField = [[NAFirstTextField alloc] init];
        _tagTextField.text = @"标签";
    }
    return _tagTextField;
}

-(NAFirstTextField *)contentTextField
{
    if (_contentTextField == nil) {
        _contentTextField = [[NAFirstTextField alloc] init];
        _contentTextField.text = @"内容";
    }
    return _contentTextField;
}

-(NAFirstTextField *)numberTextField
{
    if (_numberTextField == nil) {
        _numberTextField = [[NAFirstTextField alloc] init];
        _numberTextField.text = @"人数";
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _numberTextField;
}

-(NATextField *)timeTextField
{
    if (_timeTextField == nil) {
        _timeTextField = [[NATextField alloc] init];
        _timeTextField.placeholder = @"时间";
    }
    return _timeTextField;
}

-(NAFirstTextField *)placeTextField
{
    if (_placeTextField == nil) {
        _placeTextField = [[NAFirstTextField alloc] init];
        _placeTextField.text = @"地点";
    }
    return _placeTextField;
}

-(UILabel *)remarkLabel
{
    if (_remarkLabel == nil) {
        _remarkLabel = [[UILabel alloc] init];
        _remarkLabel.font = [UIFont systemFontOfSize:14];
        _remarkLabel.text = @"备注";
    }
    return _remarkLabel;
}

-(UITextView *)remarkTextView
{
    if (_remarkTextView == nil) {
        _remarkTextView = [[UITextView alloc] init];
        _remarkTextView.layer.borderColor = GrayColor.CGColor;
        _remarkTextView.layer.borderWidth = 1;
        _remarkTextView.userInteractionEnabled = NO;
    }
    return _remarkTextView;
}

@end
