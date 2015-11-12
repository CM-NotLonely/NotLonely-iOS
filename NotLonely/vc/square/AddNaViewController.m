//
//  AddNaViewController.m
//  NotLonely
//
//  Created by tesths on 10/30/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#import "AddNaViewController.h"
#import "NATextField.h"
#import "NAButton.h"

@interface AddNaViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UILabel *addNALb;

@property (strong, nonatomic) NATextField *nameTextField;
@property (strong, nonatomic) NATextField *tagTextField;
@property (strong, nonatomic) NATextField *contentTextField;
@property (strong, nonatomic) NATextField *numberTextField;
@property (strong, nonatomic) NATextField *timeTextField;
@property (strong, nonatomic) UIDatePicker *timeDatePicker;
@property (strong, nonatomic) UIAlertView *dateAlert;
@property (strong, nonatomic) NSNumber *unixTime;

@property (strong, nonatomic) NATextField *placeTextField;
@property (strong, nonatomic) UILabel *remarkLabel;
@property (strong, nonatomic) UITextView *remarkTextView;

@property (strong, nonatomic) NAButton *addNABtn;
@end

@implementation AddNaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WhiteColor;
    self.title = @"发布NA";
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
    
    [self.view addSubview:self.addNABtn];
    
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
    
    [self.addNABtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarkTextView.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@38);
    }];
}

- (void)sendAddNA
{
    NSDictionary *para = @{@"title":self.nameTextField.text,
                           @"desc":self.contentTextField.text,
                           @"meetTime":self.unixTime,
                           @"meetPlace":self.placeTextField.text,
                           @"personNumberAll":self.numberTextField.text,
                           @"remark":self.remarkTextView.text,
                           @"tag":self.tagTextField.text
                           };
    [CustomHud showHUDAddedTo:self.view animated:YES];
    [[[NetWork sharedManager] request_ADDNA:para] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(id data) = x;
        if (data) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [CustomHud hideHUDForView:self.view animated:YES];
}

- (void)backSquare
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate refreshList];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    if (textField == self.tagTextField || textField == self.timeTextField) {
        return NO;
    } else {
        return YES;
    }
}

-(UILabel *)addNALb
{
    if (_addNALb == nil) {
        _addNALb = [[UILabel alloc] init];
        _addNALb.text = @"发布一个Not Lonely";
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

-(NATextField *)tagTextField
{
    if (_tagTextField == nil) {
        _tagTextField = [[NATextField alloc] init];
        _tagTextField.placeholder = @"标签";
        _tagTextField.delegate = self;
        [[_tagTextField rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
            UIAlertView *chooseAlert = [[UIAlertView alloc] initWithTitle:@"标签" message:@"选择标签" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"运动🏀", @"约饭🍞", @"学习📝", @"电影👫", nil];
            [chooseAlert show];
            [[chooseAlert rac_buttonClickedSignal] subscribeNext:^(id x) {
                if ([x integerValue] == 0) {
                    
                } else if ([x integerValue] == 1) {
                    self.tagTextField.text = @"运动🏀";
                } else if ([x integerValue] == 2) {
                    self.tagTextField.text = @"约饭🍞";
                } else if ([x integerValue] == 3) {
                    self.tagTextField.text = @"学习📝";
                } else if ([x integerValue] == 4) {
                    self.tagTextField.text = @"电影👫";
                }
            }];
        }];
    }
    return _tagTextField;
}

-(NATextField *)contentTextField
{
    if (_contentTextField == nil) {
        _contentTextField = [[NATextField alloc] init];
        _contentTextField.placeholder = @"内容";
    }
    return _contentTextField;
}

-(NATextField *)numberTextField
{
    if (_numberTextField == nil) {
        _numberTextField = [[NATextField alloc] init];
        _numberTextField.placeholder = @"人数";
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _numberTextField;
}

-(NATextField *)timeTextField
{
    if (_timeTextField == nil) {
        _timeTextField = [[NATextField alloc] init];
        _timeTextField.placeholder = @"时间";
        _timeTextField.delegate = self;
        [[_timeTextField rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
            [self.dateAlert show];
            [[self.dateAlert rac_buttonClickedSignal] subscribeNext:^(id x) {
                if ([x integerValue] == 0) {
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                    NSString *dateAndTime = [dateFormatter stringFromDate:[self.timeDatePicker date]];
                    self.timeTextField.text = dateAndTime;
                    self.unixTime = [NSNumber numberWithDouble:[self.timeDatePicker.date timeIntervalSince1970]];
                }
            }];
        }];
    }
    return _timeTextField;
}

-(UIAlertView *)dateAlert
{
    if (_dateAlert == nil) {
        _dateAlert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"message" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [_dateAlert setValue:self.timeDatePicker forKey:@"accessoryView"];
    }
    return _dateAlert;
}

-(UIDatePicker *)timeDatePicker
{
    if (_timeDatePicker == nil) {
        _timeDatePicker = [[UIDatePicker alloc] init];
        _timeDatePicker.center = self.view.center;
        _timeDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [[_timeDatePicker rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
            NSLog(@"Selected date = %@", _timeDatePicker.date);
        }];
    }
    return _timeDatePicker;
}

-(NATextField *)placeTextField
{
    if (_placeTextField == nil) {
        _placeTextField = [[NATextField alloc] init];
        _placeTextField.placeholder = @"地点";
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
    }
    return _remarkTextView;
}

-(NAButton *)addNABtn
{
    if (_addNABtn == nil) {
        _addNABtn = [NAButton buttonWithType:UIButtonTypeSystem];
        _addNABtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addNABtn setTitle:@"确认发布" forState:UIControlStateNormal];
        [_addNABtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_addNABtn setBackgroundColor:BlackColor];
        [[_addNABtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self sendAddNA];
        }];
    }
    return _addNABtn;
}

@end
