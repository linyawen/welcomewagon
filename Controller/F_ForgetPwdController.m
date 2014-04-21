//
//  F_ForgetPwdController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_ForgetPwdController.h"
#import "F_AuthViewController.h"
@interface F_ForgetPwdController ()
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;

@end

@implementation F_ForgetPwdController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"忘记密码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}


- (IBAction)actionGetAuthCode:(id)sender {
    F_AuthViewController *authVCtrl = [[F_AuthViewController alloc] init];
    authVCtrl.phone = self.txtPhone.text;
    [self.navigationController pushViewController:authVCtrl animated:YES];
}

- (IBAction)actionGallCustomerService:(id)sender {
    
    
    
}

@end
