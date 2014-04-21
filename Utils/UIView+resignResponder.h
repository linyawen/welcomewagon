//
//  UIView+resignResponder.h
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-17.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (resignResponder)

/**
 *  @Desc: 递归取到当前view 下的第一响应者
 *
 */
-(UIView *)getFirstResponder;

/**
 * @Desc: 隐藏键盘
 *
 */
-(void)hideKeyBoard;

@end
