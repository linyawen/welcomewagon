//
//  F_YWLoginViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_LoginWithPhoneController.h"
#import "F_LoginWithAccountController.h"
#import "F_AuthViewController.h"
#import "F_RegistViewController.h"

#import "../FloatHelper/FloatHelper.h"
#import "../Utils/Utils.h"


@interface F_LoginWithPhoneController ()
{
    
}
// 创建UI
@property (nonatomic,weak) IBOutlet UITextField *txtPhone; // 手机号
@property (nonatomic,weak) IBOutlet UIButton *btnGetAuthCode; //获取验证码
@property (nonatomic,retain) IBOutlet UIButton *btnGoRegist;// 去注册

@property (weak, nonatomic) IBOutlet UIButton *btnAccountlogin;
@property (weak, nonatomic) IBOutlet UIButton *btnWeiboLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnQQLogin;

@end

@implementation F_LoginWithPhoneController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"登录coco";
    }
    return self;
}

-(void)setupUI
{
    [super setupUI];
    // set ui style
    [self.btnGetAuthCode setBackgroundImage:[UIImage imageNamed:@"btn_commonRed"] forState:UIControlStateNormal];
    
    [self.btnAccountlogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_phone0] highlightedImage:[UIImage imageNamed:kBtn_login_phone1]];
    [self.btnWeiboLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_weibo0] highlightedImage:[UIImage imageNamed:kBtn_login_weibo1]];
    [self.btnQQLogin commonBGwithNormalImage:[UIImage imageNamed:kBtn_login_qq0] highlightedImage:[UIImage imageNamed:kBtn_login_qq1]];
    
    
    // bind event
    [self.btnGetAuthCode addTarget:self action:@selector(actionBtnAuthCode) forControlEvents:UIControlEventTouchUpInside];
    [self.btnGoRegist addTarget:self action:@selector(actionBtnGoRegist) forControlEvents:UIControlEventTouchUpInside];
    [self.btnAccountlogin addTarget:self action:@selector(actionbtnAccountlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnWeiboLogin addTarget:self action:@selector(actionBtnWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.btnQQLogin addTarget:self action:@selector(actionBtnQQLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"F_LoginWithPhoneController viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"F_LoginWithPhoneController viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"F_LoginWithPhoneController viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"F_LoginWithPhoneController viewDidDisappear");
}

#pragma mark - actions
#pragma mark    获取验证码
-(void)actionBtnAuthCode
{
    F_AuthViewController *authVCtrl = [[F_AuthViewController alloc] init];
    authVCtrl.phone = _txtPhone.text;
    [self.navigationController f_pushViewController:authVCtrl animated:YES];
}

#pragma mark    去注册
-(void)actionBtnGoRegist
{
    F_RegistViewController *registVCtrl = [[F_RegistViewController alloc] init];
    [self.navigationController pushViewController:registVCtrl animated:YES];
}

#pragma mark    切换到coco账号登录
-(void)actionbtnAccountlogin
{
    [self performSelector:@selector(gotoAccountVCtrl) withObject:Nil afterDelay:0.0];
}

-(void)gotoAccountVCtrl
{
    F_LoginWithAccountController *loginWithAccount = [[F_LoginWithAccountController alloc] init];
    YWNavigationController *nav = (YWNavigationController *)self.navigationController;
    [nav replaceViewController:loginWithAccount animated:NO];
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
