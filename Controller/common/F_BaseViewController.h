//
//  f_BaseViewController.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-21.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../../FloatHelper/FloatHelper.h"
#import "../../Utils/Utils.h"


/*
 *  悬浮窗的 UIViewController 基类
 */

@interface F_BaseViewController : UIViewController

// 是否可以关闭.  default YES
@property (nonatomic,assign)BOOL isCloseAble;
// 导航栏标题是否需要 Coco 熊图标. default YES
@property (nonatomic,assign)BOOL isTitleNeedLogo;

// 创建 UI
// to be  overrided
-(void)setupUI;

//- (void)presentViewController:(UIViewController *)viewControllerToPresent
//                     animated: (BOOL)flag
//                   completion:(void (^)(void))completion;

@end
