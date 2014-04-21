//  F_UserCompleteViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_UserCompleteViewController.h"



@interface F_UserCompleteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNickName;
@property (weak, nonatomic) IBOutlet UIButton *btnComplete;
@end

@implementation F_UserCompleteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"完善个人信息";
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
    NSLog(@"F_UserCompleteViewController viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"F_UserCompleteViewController viewDidAppear");
}

-(void)setupUI
{
    [super setupUI];
    [self.btnComplete setBackgroundImage:[UIImage imageNamed:@"btn_commonRed"] forState:UIControlStateNormal];
//    [self.btnComplete setBackgroundImage:[UIImage imageNamed:@"btn_commonRed"] forState:UIControlStateNormal];
    [self.btnComplete addTarget:self action:@selector(actionComplete) forControlEvents:UIControlEventTouchUpInside];
}

-(void)actionComplete
{
    [self flDismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}

@end
