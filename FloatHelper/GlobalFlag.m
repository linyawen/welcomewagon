//
//  FloatAppClobalFlag.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "GlobalFlag.h"

@implementation GlobalFlag

-(id)init
{
    self = [super init];
    if (self) {
        self.ifAppNeedToAddFloatmodul = NO;
    };
    return self;
}

+(GlobalFlag *)shareFlag
{
    static GlobalFlag * gFlag = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gFlag = [[GlobalFlag alloc] init];
    });
    return gFlag;
}

@end
