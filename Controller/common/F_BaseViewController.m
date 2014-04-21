//
//  f_BaseViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "F_BaseViewController.h"
#import "f_common.h"
#import "../../View/YWNavView.h"
#import "../../FloatHelper/FloatHelper.h"


@interface F_BaseViewController ()
{
}

@end

@implementation F_BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:[NSBundle resBundle]];
    if (self) {
        _isCloseAble = YES;
        _isTitleNeedLogo = YES;
        NSLog(@"init:%@",NSStringFromClass([self class]));
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
    [self enableButtonStretch];
}

-(void)setupNavBg
{
    UIImage *nav_bar = [UIImage imageNamed:@"bg_topbar"];
    [self.navigationController.navigationBar setBackgroundImage:nav_bar forBarMetrics:UIBarMetricsDefault];
}

-(void)setupNavTitle
{
    if (_isTitleNeedLogo)
        self.navigationItem.titleView = [[YWNavView alloc] initWithTitle:self.title];
}

-(void)setupBtnBack
{
    if (self.navigationController.viewControllers.count > 1)
        [self addFLBarItemBack];
}

-(void)setupUI
{
    [self defaultBackgroundImage];
    if (self.navigationController)
    {
        [self setupNavBg];
        [self setupBtnBack];
        [self setupNavTitle];
    };
    if (_isCloseAble)
        [self addFLBarItemClose];
}

//- (void)presentViewController:(UIViewController *)viewControllerToPresent
//                     animated: (BOOL)flag
//                   completion:(void (^)(void))completion
//{
//    [self f_presentViewController:(UIViewController *)viewControllerToPresent
//                         animated:(BOOL)flag
//                       completion:(void (^)(void))completion];
//}

-(void)dealloc{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}


@end
