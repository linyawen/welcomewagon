//
//  F_AuthViewController.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common/f_common.h"


/*
 *   获取验证码模块
 *
 */

@interface F_AuthViewController : F_BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnGetAuthCode;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *lblAuthCode;

//电话号码
@property (nonatomic,retain) NSString * phone;
@end
