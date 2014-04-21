//
//  YWNavigationController.h
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-11.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *
 *  @Desc: 之所以要自定义 UINavigationController, 
 *          是因为账号模块设计时 登录可以进入注册，注册可以进度登录，
 *          防止 push 进去重复的，太多层级的登录，注册ViewController，
 *          所以自定了了UINavigationController,
 *          实现了当Push 一个已经存在的 ViewCtrl，就 pop到那个 Viewctrl
 *                                     ---- by linyawen
 **/



@interface UIViewController(YWNavigationKey)

-(NSString *)navigationKey;
@end

@interface YWNavigationController : UINavigationController
{
    NSMutableDictionary * _viewCtrlMapping;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController;


/**
 * 重写以下这几个方法，主要实现了，防止push 进去同一个class 的多个 Viewcontroller
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (UIViewController *)popViewControllerAnimated:(BOOL)animated;
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

/**
 * 替换当前的ViewCtrl
 * @param newViewCtrl: 新的viewcontroller
 **/
-(void)replaceViewController:(UIViewController *)newViewCtrl animated:(BOOL) animated;
@end
