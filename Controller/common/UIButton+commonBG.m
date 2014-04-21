//
//  UIButton+commonBG.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-27.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIButton+commonBG.h"
#import "floatUIConfig.h"

@implementation UIButton (commonBG)

-(void)commonBGwithNormalImage:(UIImage *)nImage highlightedImage:(UIImage *)hImage
{
    [self setBackgroundImage:[UIImage imageNamed:kBtn_Common_bgNormal] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:kBtn_Common_bgHighlight] forState:UIControlStateHighlighted];
    [self setImage:nImage forState:UIControlStateNormal];
    [self setImage:hImage forState:UIControlStateHighlighted];
}


@end
