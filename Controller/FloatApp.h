//
//  FloatApp.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-13.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../View/FloatRootWindow.h"
#import "../View/YWMaskLogo.h"


/*
 *   悬浮功能模块逻辑入口
 */

@interface FloatApp : UIViewController
{
    YWMaskLogo *_logo;
    //悬浮模块工作区域
    FloatRootWindow *_cocoWindow;
    
    UIApplication *_app;
    UIViewController *_appRootViewController;
    CGRect _appBounds;
    UIViewController *_rootViewController;
}

// 悬浮模块 根视图,逻辑入口
@property(nonatomic,retain) UIViewController *rootViewController;
//悬浮可拖动的图标，coco 熊
@property(nonatomic,retain,readonly) YWMaskLogo *logo;
//hook 目标 app 相关
@property(nonatomic,retain) UIApplication *app;
// hook 的 app 的根视图
@property(nonatomic,retain) UIViewController *appRootViewController;
// 悬浮框当前状态，
@property(nonatomic,assign) BOOL isOpen;
-(id)initWithRootViewController:(UIViewController *) vctrl;



// 往app 植入悬浮模块
-(void)attachToApp;
//根据屏幕适应布局
-(void)adjustLayout;

// 关闭悬浮窗
-(void)close;
// 打开悬浮窗
-(void)open;

// 悬浮 window 大小
-(CGRect)floatScreenBounds;


//lazy load
-(YWMaskLogo *)logo;
//设置根视图
-(void)setRootViewController:(UIViewController *)vctrl;



//@creator
+(FloatApp *) shareFloatApp;
//开启
+(FloatApp *) startFLoatApp;

@end
