//
//  YWMaskLogo.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-2.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWDragView.h"

#define kMaskLogoRect CGRectMake(0,0,50,50)

@class YWMaskLogo;
typedef void(^MaskTapBlock)(YWMaskLogo *logo);

/**
 *     悬浮模中可以拖动的,并且可以点击的UIView
 *  用于 CoCo 熊图标
 */
@interface YWMaskLogo : YWDragView
{
    //当前状态 default NO
//    BOOL _open;     // 该属性 移到floatApp类
}

/*
 * @creator convenient
 */
+(YWMaskLogo *)maskLogoView;
/*
 *  @creator singleton
 */
+(YWMaskLogo *)shareWindow;
/* @creator default*/
-(id)init;
/* @creator with UIImage */
-(id)initWithUIImage:(UIImage *)image;
/* @creator with UIImage and frame */
-(id)initWithUIImage:(UIImage *)image withFrame:(CGRect) frame;

/*
 *  @param block: 点击的回调block
 */
-(void)setTapCallback:(MaskTapBlock) block;
@property (nonatomic,copy) MaskTapBlock tapblock;
//当前状态
//@property (nonatomic,assign) BOOL open;

@end
