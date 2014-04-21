//
//  UINavigationController+hidekeyboard.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UINavigationController+hidekeyboard.h"
#import "../Utils/Utils.h"

@implementation UINavigationController (hidekeyboard)

-(void)f_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.topViewController.view hideKeyBoard];
    [self pushViewController:viewController animated:YES];
}

-(UIViewController *)f_popViewControllerAnimated:(BOOL)animated
{
    NSLog(@"f_popViewControllerAnimated");
    [self.topViewController.view hideKeyBoard];
    return [self popViewControllerAnimated:animated];
}

@end
