//
//  F_AuthViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_AuthViewController.h"
#import "F_UserCompleteViewController.h"
//#import "F_LoginWithPhoneController.h"

@interface F_AuthViewController ()

@end

@implementation F_AuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"填写验证码";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)setupUI
{
    [super setupUI];
    
    self.lblPhone.text = [NSString stringWithFormat:@"请输入发送到%@的验证码",self.phone];
    
    [self.btnGetAuthCode setBackgroundImage:[UIImage imageNamed:@"btn_commonGray"] forState:UIControlStateNormal];
    
    [self.btnLogin setBackgroundImage:[UIImage imageNamed:@"btn_commonRed"] forState:UIControlStateNormal];
    [self.btnLogin addTarget:self action:@selector(actionLogin) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - actions

-(void)actionLogin
{
    F_UserCompleteViewController * userVCtrl = [[F_UserCompleteViewController alloc] init];
    [self.navigationController f_pushViewController:userVCtrl animated:YES];
}



@end
