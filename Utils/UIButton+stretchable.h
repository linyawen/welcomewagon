//
//  UIButton+stretchable.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UIButton (stretchable)

/* 自动拉伸Button背景，可拉伸区域默认 1px */
-(void)enableStretch;
@end

@interface UIViewController(stretchableButton)
// 使当前view 层级下 button 背景图片自动拉伸
-(void)enableButtonStretch;

@end
