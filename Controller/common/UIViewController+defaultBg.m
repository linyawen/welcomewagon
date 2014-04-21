//
//  UIViewController+defaultBg.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIViewController+defaultBg.h"
#import "../../Utils/UIView+background.h"

@implementation UIViewController (defaultBg)

-(void)defaultBackgroundImage
{
    self.view.backgroundImage = [UIImage imageNamed:@"bg_common"];
}

@end
