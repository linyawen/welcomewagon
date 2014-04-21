//
//  FloatRootWindow.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-13.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "FloatRootWindow.h"
#import "../FloatHelper/FloatAppConfig.h"

@interface FloatRootWindow()
{
}
@end

@implementation FloatRootWindow

+(FloatRootWindow *)floatRootWindowWithDefaultFrame
{
    FloatRootWindow * window = [[FloatRootWindow alloc] initWithFrame:kFloatWindowRect];
    return window;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        // for test
//        UILabel *top = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//        top.text = @"top";
//        top.backgroundColor = [UIColor yellowColor];
////        top.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
//        UILabel *bottom = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 100, 40)];
//        bottom.text = @"bottom";
//        bottom.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//        [self addSubview:top];
//        [self addSubview:bottom];
    };
    return self;
}

-(void)setRootViewController:(UIViewController *)rootViewController
{
    _rootViewController = rootViewController;
//    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        UIView *view = obj;
//        [view removeFromSuperview];
//    }];
    [_rootViewController.view setFrame:self.bounds];
    [self addSubview:_rootViewController.view];

}


@end
