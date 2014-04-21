//
//  YWNavView.h
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-10.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 *  用来实现通用的自定已导航栏标题(带coco图标的)
 *
 */


#define kImage_cocoLogo @"app_icon"
#define KRect_logo CGRectMake(0, 0, 30, 30)
#define kFont_logo [UIFont boldSystemFontOfSize:14]
#define kPadding 7

@interface YWNavView : UIView

-(YWNavView *)initWithTitle:(NSString *)title;
//-(id)initWithFrame:(CGRect)frame;

@end
