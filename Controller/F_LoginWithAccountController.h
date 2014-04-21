//
//  F_LoginWithAccountController.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common/f_common.h"

/*
 *   coco账号 登录模块
 *
 */

@interface F_LoginWithAccountController : F_BaseViewController


//忘记密码
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPwd;
//登录
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
//去注册
@property (weak, nonatomic) IBOutlet UIButton *btnGoRegist;
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
