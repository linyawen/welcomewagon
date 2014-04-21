//
//  F_RegistViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-27.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_RegistViewController.h"
#import "F_UserCompleteViewController.h"
#import "FloatApp.h"

#import "common/f_common.h"



@interface F_RegistViewController ()

@end

@implementation F_RegistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"注册";
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
    
    // Set UI Style
    [self.btnRegist setBackgroundImage:[UIImage imageNamed:kBtn_Common_bgHighlight] forState:UIControlStateNormal];
    [self.btnPhoneLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_phone0] highlightedImage:[UIImage imageNamed:kBtn_login_phone1]];
    [self.btnWeiboLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_weibo0] highlightedImage:[UIImage imageNamed:kBtn_login_weibo1]];
    [self.btnQQLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_qq0] highlightedImage:[UIImage imageNamed:kBtn_login_qq1]];
    
    
    //Bind Event
    [self.btnRegist addTarget:self action:@selector(actionBtnRegist) forControlEvents:UIControlEventTouchUpInside];
    [self.btnShowPwd addTarget:self action:@selector(actionBtnShowPwd) forControlEvents:UIControlEventTouchUpInside];
    [self.btnAgree addTarget:self action:@selector(actionBtnAgree) forControlEvents:UIControlEventTouchUpInside];
    [self.btnCocoAgreement addTarget:self action:@selector(actionBtnCocoAgreement) forControlEvents:UIControlEventTouchUpInside];
        //  third party login
    [self.btnPhoneLogin addTarget:self action:@selector(actionBtnPhoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnWeiboLogin addTarget:self action:@selector(actionBtnWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnQQLogin addTarget:self action:@selector(actionBtnQQLogin) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - actions
#pragma mark    注册
-(void)actionBtnRegist
{
//    F_UserCompleteViewController * userVCtrl = [[F_UserCompleteViewController alloc] init];
//    [FloatApp shareFloatApp].rootViewController = userVCtrl;
}

#pragma mark   显示密码
-(void)actionBtnShowPwd
{
    
}

#pragma mark  我已阅读并同意
-(void)actionBtnAgree
{
    
}

#pragma mark  触控账户使用协议
-(void)actionBtnCocoAgreement
{
    
}

#pragma mark    切换到手机号登录
-(void)actionBtnPhoneLogin
{
    [self performSelector:@selector(gotoAccountVCtrl) withObject:nil afterDelay:0.0];
}

-(void)gotoAccountVCtrl
{
//    F_LoginWithPhoneController * loginWithPhone = [[F_LoginWithPhoneController alloc] init];
//    YWNavigationController * nav = (YWNavigationController *)self.navigationController;
//    [nav replaceViewController:loginWithPhone animated:NO];
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
