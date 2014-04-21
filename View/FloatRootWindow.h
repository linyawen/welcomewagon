//
//  FloatRootWindow.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-13.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *      悬浮界面的根视图
 *  用来限定悬浮界面的坐标，范围
 *         ------ 考虑 去掉这个类
 *
 */



@interface FloatRootWindow : UIView
{
    UIViewController * _rootViewController;
//    UIViewController *_appRootViewController;
}

// 宿主 app rootviewcontroller
//@property(nonatomic,retain) UIViewController * appRootViewController;
// 悬浮模块 rootviewcontroller
//@property(nonatomic,retain) UIViewController * rootViewController;
/*
 *  @param floatRootViewController: 设定悬浮窗的 rootviewcontroller,维护自己的视图逻辑
 */
//-(void)setRootViewController:(UIViewController *)floatRootViewController;

+(FloatRootWindow *)floatRootWindowWithDefaultFrame;

@end
