//
//  UIViewController+floatApp.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-14.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 *      扩展UIViewcontroller ,使之适应悬浮界面
 *  主要是用来实现一些自定义视图切换动画，以及回调,目前实现:
 *  1， Present弹出动画（下 -> 上）,Dismiss (上 -> 下)
 */

@interface UIViewController (floatApp)

/*  @Desc :凡是 present 出来的 viewController 都默认直接暂满整个float window
 *         效果同viewController presentViewController:animate:completion:
 *
 *  @param  viewControllerToPresent: 将要弹出的viewcontroller
 *  @param  flag:  是否用动画
 *  @param  completion: present完成的回调
 */
-(void)flPresentViewController:(UIViewController *)viewControllerToPresent
                         animated:(BOOL)flag
                       completion:(void (^)(void))completion;

/*
 *  @Desc :dismiss 弹出的UIViewController
 *         效果同viewcontroller dismissViewControllerAnimated:completion
 *  @param flag: 是否用动画
 *  @param comletion: dmiss 完成的回调
 */
-(void)flDismissViewControllerAnimated: (BOOL)flag
                          completion: (void (^)(void))completion;

// @Desc :该 viewctrl present 到的 Viewctrl
//        同 viewcontroller.presentedViewController
@property(nonatomic,readonly) UIViewController *flPresentedViewController;

// @Desc : present当前viewctrl 的 下层viewctrl
//        同 viewcontroller.presentingViewController
@property(nonatomic,readonly) UIViewController *flPresentingViewController;



@end
