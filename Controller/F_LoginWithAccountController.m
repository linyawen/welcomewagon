//
//  F_LoginWithAccountController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_LoginWithAccountController.h"
#import "F_LoginWithPhoneController.h"
#import "F_ForgetPwdController.h"
#import "F_UserCompleteViewController.h"
#import "F_RegistViewController.h"

#import "../FloatHelper/FloatHelper.h"
#import "common/f_common.h"

@interface F_LoginWithAccountController ()

@end

@implementation F_LoginWithAccountController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登录coco";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"F_LoginWithAccountController viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"F_LoginWithAccountController viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"F_LoginWithAccountController viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"F_LoginWithAccountController viewDidDisappear");
}

-(void)setupUI
{
    [super setupUI];
    // Set UI Style
    [self.btnLogin setBackgroundImage:[UIImage imageNamed:@"btn_commonRed"] forState:UIControlStateNormal];
    [self.btnPhoneLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_phone0] highlightedImage:[UIImage imageNamed:kBtn_login_phone1]];
    [self.btnWeiboLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_weibo0] highlightedImage:[UIImage imageNamed:kBtn_login_weibo1]];
    [self.btnQQLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_qq0] highlightedImage:[UIImage imageNamed:kBtn_login_qq1]];
    
    // bind event
    [self.btnLogin addTarget:self action:@selector(actionBtnLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnGoRegist addTarget:self action:@selector(actionBtnGoRegist) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForgetPwd addTarget:self action:@selector(actionBtnForgetPwd) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnPhoneLogin addTarget:self action:@selector(actionBtnPhoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnWeiboLogin addTarget:self action:@selector(actionBtnWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnQQLogin addTarget:self action:@selector(actionBtnQQLogin) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - actions
#pragma mark    忘记密码
-(void)actionBtnForgetPwd
{
    F_ForgetPwdController *forgetPwdVCtrl = [[F_ForgetPwdController  alloc] init];
    [self.navigationController pushViewController:forgetPwdVCtrl animated:YES];
}

#pragma mark    登录
-(void)actionBtnLogin
{
    
}

#pragma mark    去注册
-(void)actionBtnGoRegist
{
    F_RegistViewController *registVCtrl = [[F_RegistViewController alloc] init];
    [self.navigationController pushViewController:registVCtrl animated:YES];
}

#pragma mark    切换到手机号登录
-(void)actionBtnPhoneLogin
{
    [self performSelector:@selector(gotoAccountVCtrl) withObject:nil afterDelay:0.0];
}

-(void)gotoAccountVCtrl
{
    F_LoginWithPhoneController * loginWithPhone = [[F_LoginWithPhoneController alloc] init];
    YWNavigationController * nav = (YWNavigationController *)self.navigationController;
    [nav replaceViewController:loginWithPhone animated:NO];
}

#pragma mark 微博登录
-(void)actionBtnWeiboLogin
{
    
}

#pragma mark QQ 登录
-(void)actionBtnQQLogin
{
    
}




@end
