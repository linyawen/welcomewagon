//
//  UIViewController+quickNavBarItem.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (quickNavBarItem)

// 添加nav 按钮: 回退
-(void)addFLBarItemBack;
// 添加bar 按钮： dismiss （对应与f_presentviewcontroller）
-(void)addFLBarItemDismiss;
// 添加bar 按钮： 关闭悬浮窗
-(void)addFLBarItemClose;
@end
