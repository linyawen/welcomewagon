//
//  FloatApp.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-13.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "FloatApp.h"
#import "../Controller/F_LoginWithPhoneController.h"
#import "../Controller/F_LoginWithAccountController.h"
#import "../Controller/F_AuthViewController.h"
#import "../Controller/F_RegistViewController.h"
#import "../Utils/UIView+resignResponder.h"
#import "../Utils/Utils.h"

#import <math.h>

#define kFloatAppAnimationDuration  0.3

@implementation FloatApp


#pragma mark - creator
+(FloatApp *) shareFloatApp
{
    static FloatApp * floatapp = nil;
    if (nil == floatapp) {
        UIViewController *rootVCtrl =
        //        [[F_AuthViewController alloc] init];
        //        [[F_LoginWithPhoneController alloc] init];
        [[F_LoginWithAccountController alloc] init];
//        [[F_RegistViewController alloc] init];
        UINavigationController *nav = [[YWNavigationController alloc] initWithRootViewController:rootVCtrl];
        floatapp = [[FloatApp alloc] initWithRootViewController:nav];
    };
    return floatapp;
}

#pragma mark - startFLoatApp
+(FloatApp *) startFLoatApp
{
    NSLog(@"startFLoatApp");
    FloatApp * floatapp = [FloatApp shareFloatApp];
    [floatapp attachToApp];
    return floatapp;
}

#pragma mark - init
-(id)initWithRootViewController:(UIViewController *) vctrl
{
    self = [super init];
    if (self) {
        [self setRootViewController:vctrl];
        _isOpen = NO;
    };
    return self;
}

-(void)loadView
{
    _cocoWindow = [FloatRootWindow floatRootWindowWithDefaultFrame];
    self.view = _cocoWindow;
    self.view.clipsToBounds = YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)attachToApp
{
    self.app = [UIApplication sharedApplication];
}

#pragma mark - getter / settor
-(YWMaskLogo *)logo{
    if (!_logo) {
        _logo = [YWMaskLogo maskLogoView];
    };
    return _logo;
}

-(void)setRootViewController:(UIViewController *)vctrl
{
    if (_rootViewController) {
        [_rootViewController.view removeFromSuperview];
        [_rootViewController removeFromParentViewController];
    };
    
    {
        _rootViewController = vctrl;
        [_rootViewController.view setFrame:self.view.bounds];
        [self.view addSubview:_rootViewController.view];
        [self addChildViewController:_rootViewController];
    };
}

-(void)setAppRootViewController:(UIViewController *)appRootViewController
{
    if (_appRootViewController) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        [self.logo removeFromSuperview];
        _appRootViewController = appRootViewController;
    }else
    {
        _appRootViewController = appRootViewController;
    };
    
    /* * * * * *  把悬浮模块 跟 logo 添加到 目标 app   * * * * */
    _appBounds = _appRootViewController.view.bounds;
    // 加载悬浮工作区
    [_appRootViewController addChildViewController:self];
    [_appRootViewController.view addSubview:self.view];
    // 加载悬浮coco图标
    [_appRootViewController.view addSubview:self.logo];
    self.logo.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin;
    // logo 点击回调
    __weak FloatApp * weakself = self;
    [self.logo setTapCallback:^(YWMaskLogo * logo) {
        if (!weakself.isOpen) {
            [weakself open];
        }else
        {
            [weakself close];
        }
    }];
    [self adjustLayout];
    self.view.hidden = YES;
}

-(void)setApp:(UIApplication *)app
{
    if (_app) {
        nil;
    }else
    {
        _app = [UIApplication sharedApplication];
        UIViewController *appRootViewController = _app.keyWindow.rootViewController;
        if (!appRootViewController) {
            NSArray *array = [_app.keyWindow subviews];
            UIView *rootView = [array objectAtIndex:0];
            appRootViewController = (UIViewController *)[rootView nextResponder];
            {
//            NSLog(@"window frame: %@",NSStringFromCGRect(_app.keyWindow.frame));
//            NSLog(@"window bounds: %@",NSStringFromCGRect(_app.keyWindow.bounds));
//            NSLog(@"viewRootViewCtrltrl : %@",rootViewCtrl);
//            NSLog(@"_appRootViewController frame: %@",NSStringFromCGRect(rootViewCtrl.view.frame));
//            NSLog(@"_appRootViewController bounds: %@",NSStringFromCGRect(rootViewCtrl.view.bounds));
            };
        };
        
        if ([appRootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav =(UINavigationController *)appRootViewController;
            appRootViewController = [nav topViewController];
//            appRootViewController = nav;
//            NSLog(@"setNavRoot");
        } if ([appRootViewController isKindOfClass:[UITabBarController class]]) {
            // maybe i think too much ...  here
            UITabBarController * tab = (UITabBarController *)appRootViewController;
            appRootViewController = tab.selectedViewController;
        };
        self.appRootViewController = appRootViewController;
    };
}

#pragma mark - 布局调整

#define RectX(rect) rect.origin.x
#define RectY(rect) rect.origin.y
#define RectWidth(rect) rect.size.width
#define RectHeight(rect) rect.size.height
-(void)open
{
    [UIView animateWithDuration:kFloatAppAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.hidden = NO;
        [self moveInWindow];
    } completion:^(BOOL finished) {
        _isOpen = !_isOpen;
    }];
}

-(void)close
{
    [self.view hideKeyBoard];
    [UIView animateWithDuration:kFloatAppAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self moveOutWindow];
    } completion:^(BOOL finished) {
        self.view.hidden = YES;
        _isOpen = !_isOpen;
    }];
}

-(void)adjustLayout
{
    [self adjustWindowFrame];
    if (UIInterfaceOrientationIsLandscape(_app.statusBarOrientation)) {
        [self layoutLandscape];
    }else if (UIInterfaceOrientationIsPortrait(_app.statusBarOrientation))
    {
        [self layoutPortrait];
    };
}

-(void)layoutLandscape
{
    [self positionLogo];
    [self windowRightTop];
}

#pragma mark 防止window 在右上
-(void)windowRightTop
{
    self.view.hidden = NO;
//    [self moveInWindow];
    [self moveOutWindow];
}

-(void)layoutPortrait
{
    //暂时不特殊化
    [self positionLogo];
    [self windowRightTop];
}

#pragma mark 放置 logo于左下
-(void)positionLogo
{
    CGRect logoBounds = self.logo.bounds;
    self.logo.center = CGPointMake(RectWidth(logoBounds)/2, RectHeight(_appBounds) - RectHeight(logoBounds)/2);
}

#pragma mark 调整window 大小,坐标，防止出界
-(void)adjustWindowFrame
{
    CGRect windowBounds = self.view.bounds;
    CGPoint origin = CGPointZero;
    CGSize newWinSize = self.view.bounds.size;
    origin.x = RectWidth(_appBounds) - RectWidth(windowBounds);
    if (origin.x < 0) {
        origin.x = 0;
        newWinSize.width = RectWidth(_appBounds);
    };
    if (!_app.statusBarHidden) {
        if ([_appRootViewController isKindOfClass:[UINavigationController class]]) {
            origin.y = 20;
        };
        CGFloat deltaHeight = RectHeight(_appBounds) - (origin.y + RectHeight(windowBounds));
        if (deltaHeight < 0) {
            newWinSize.height = newWinSize.height + deltaHeight;
        };
    };
    self.view.frame = CGRectMake(origin.x, origin.y, newWinSize.width, newWinSize.height);
}
#pragma mark 移动 window到屏幕内(动画用-显现)
-(void)moveInWindow
{
    CGRect windowBounds = self.view.bounds;
    self.view.center = CGPointMake(RectWidth(_appBounds)-RectWidth(windowBounds)/2, RectHeight(_appBounds)-RectHeight(windowBounds)/2);
}
#pragma mark 移动 window到屏幕外(动画用-隐藏)
-(void)moveOutWindow
{
    CGRect windowBounds = self.view.bounds;
    CGPoint offset = CGPointZero;
    offset.y -= RectHeight(windowBounds);
    self.view.center = CGPointMake(RectWidth(_appBounds)-RectWidth(windowBounds)/2, RectHeight(windowBounds)/2+offset.y);
}

-(CGRect)floatScreenBounds
{
    return self.view.bounds;
}

// for ios 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation == [_app statusBarOrientation];
}


@end
