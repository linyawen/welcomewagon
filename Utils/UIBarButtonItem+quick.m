//
//  UIBarButtonItem+quick.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIBarButtonItem+quick.h"

@implementation UIBarButtonItem (quick)


+(UIBarButtonItem *)barButtomItemWithImg0:(NSString *)imgname0
                                 withImg1:(NSString *)imgname1
                                   target:(id)target
                                   action:(SEL)action
{
    UIImage * img0 = [UIImage imageNamed:imgname0];
    UIImage * img1 = [UIImage imageNamed:imgname1];
    UIButton * btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, img0.size.width, img0.size.height)];
    [btnLeft setImage:img0 forState:UIControlStateNormal];
    [btnLeft setImage:img1 forState:UIControlStateHighlighted];
    [btnLeft addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    return barItem;
}




@end
