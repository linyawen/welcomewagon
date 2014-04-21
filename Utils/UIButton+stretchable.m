//
//  UIButton+stretchable.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIButton+stretchable.h"

@implementation UIButton (stretchable)


- (void)setBackgroundImageStretchableForState:(UIControlState)controlState
{
    UIImage *image = [self backgroundImageForState:controlState];
    if (image)
    {
        CGFloat capWidth =  floorf(image.size.width / 2);
        CGFloat capHeight =  floorf(image.size.height / 2);
        UIImage *capImage = [image resizableImageWithCapInsets:
                             UIEdgeInsetsMake(capHeight, capWidth, capHeight, capWidth)];
        [self setBackgroundImage:capImage forState:controlState];
    };
}

-(void)enableStretch
{
    [self setBackgroundImageStretchableForState:UIControlStateNormal];
    [self setBackgroundImageStretchableForState:UIControlStateHighlighted];
}

@end


@implementation UIViewController(stretchableButton)

-(void)enableButtonStretch
{
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"self isKindOfClass:%@",[UIButton class]];
    NSArray *buttons = [self.view.subviews filteredArrayUsingPredicate:predicate];
    for (UIButton *button in buttons)
        [button enableStretch];
}

@end