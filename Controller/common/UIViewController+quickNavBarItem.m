//
//  UIViewController+quickNavBarItem.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIViewController+quickNavBarItem.h"
#import "../../Utils/Utils.h"
#import "../FloatApp.h"
#import "../../FloatHelper/FloatHelper.h"

#define IOS6_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )

@implementation UIViewController (quickNavBarItem)

#pragma mark - Back
-(void)addFLBarItemBack
{
    UIBarButtonItem *itmBack = [UIBarButtonItem barButtomItemWithImg0:@"btn_back_0"
                                                             withImg1:@"btn_back_1"
                                                               target:self
                                                               action:@selector(actionBack)];
    self.navigationItem.leftBarButtonItem = itmBack;
}

-(void)actionBack
{
    if (self.navigationController) {
        BOOL ifAnimate = IOS6_OR_LATER;// ios 5  pop动画时，如果游戏里面有 UINav，则会引起整个游戏 开始动画
        [self.navigationController f_popViewControllerAnimated:ifAnimate];
    };
}

#pragma mark - Dismiss
-(void)addFLBarItemDismiss
{
    UIBarButtonItem *itmDismiss = [UIBarButtonItem barButtomItemWithImg0:@"btn_back_0"
                                                             withImg1:@"btn_back_1"
                                                               target:self
                                                               action:@selector(actionDismiss)];
    self.navigationItem.leftBarButtonItem = itmDismiss;

}

-(void)actionDismiss
{
    if (self.flPresentingViewController) {
        [self flDismissViewControllerAnimated:YES completion:^{
            nil;
        }];
    };
}

#pragma mark - Close
-(void)addFLBarItemClose
{
    UIBarButtonItem * itmClose = [UIBarButtonItem barButtomItemWithImg0:@"btn_close_0"
                                                               withImg1:@"btn_close_1"
                                                                 target:self
                                                                 action:@selector(actionFlClose)];
    self.navigationItem.rightBarButtonItem = itmClose;
}

-(void)actionFlClose
{
//    UIView * first = [self.view getFirstResponder];
//    NSLog(@"first :%@ ",first);
//    [self.view hideKeyBoard];
    [[FloatApp shareFloatApp] close];
}


@end
