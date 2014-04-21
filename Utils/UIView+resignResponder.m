//
//  UIView+resignResponder.m
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-17.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import "UIView+resignResponder.h"

@implementation UIView (resignResponder)

-(UIView *)getFirstResponder
{
    if ([self respondsToSelector:@selector(isFirstResponder)] && [self isFirstResponder]) {
        return self;
    };
    for ( UIView *childView in self.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] )
            return childView;
        UIView *result = [childView getFirstResponder];
        if ( result ) return result;
    };
    return nil;
}

-(void)hideKeyBoard
{
    [[self getFirstResponder] resignFirstResponder];
}

@end
