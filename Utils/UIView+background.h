//
//  UIView+background.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    //平铺
    UIViewBgImgModeTiled = 0,
    //拉伸
    UIViewBgImgModeStretch
} UIViewBgImgModeType;

@interface UIView (background)

@property (nonatomic,retain) UIImage * backgroundImage;

-(UIImage *)backgroundImage;

// 默认填充方式： UIViewBgImgModeTiled
// 等于 setBackgroundImage:withFileMode:UIViewBgImgModeTiled
-(void)setBackgroundImage:(UIImage *)backgroundImage;


// @Desc 给 UIView 设置背景图片
// @param img : 背景图片
// @param mode : 填充模式 UIViewBgImgModeTiled 平铺，UIViewBgImgModeStretch 拉伸
-(void)setBackgroundImage:(UIImage *)img withFileMode:(UIViewBgImgModeType) mode;
@end
