//
//  F_RegistViewController.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-27.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_BaseViewController.h"



/**
 *
 *      注册模块
 *
 */


@interface F_RegistViewController : F_BaseViewController


//显示密码
@property (weak, nonatomic) IBOutlet UIButton *btnShowPwd;
//注册
@property (weak, nonatomic) IBOutlet UIButton *btnRegist;
//我已经阅读并同意
@property (weak, nonatomic) IBOutlet UIButton *btnAgree;
//触控账户使用协议
@property (weak, nonatomic) IBOutlet UIButton *btnCocoAgreement;


/*
 *-------------------------------
 */
//手机登录
@property (weak, nonatomic) IBOutlet UIButton *btnPhoneLogin;
//微博登录
@property (weak, nonatomic) IBOutlet UIButton *btnWeiboLogin;
//QQ登录
@property (weak, nonatomic) IBOutlet UIButton *btnQQLogin;

@end
