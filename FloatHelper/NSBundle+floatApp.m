//
//  NSBundle+floatApp.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-16.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "NSBundle+floatApp.h"
#import "FloatAppConfig.h"

@implementation NSBundle (floatApp)

+(NSBundle *)floatAppBundle
{
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle= [[NSBundle alloc] initWithPath:kBundlePath];
    });
    return bundle;
}

+(NSBundle *)resBundle
{
    if (0 == kPlugins) {
        return [NSBundle mainBundle];
    }else
    {
        return [NSBundle floatAppBundle];
        
    };
}
@end
