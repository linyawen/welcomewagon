//
//  UINavigationController+hidekeyboard.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *   实现切换视图之前 隐藏 keyboard
 *
 */

@interface UINavigationController (hidekeyboard)

-(void)f_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
-(UIViewController *)f_popViewControllerAnimated:(BOOL)animated;
@end
