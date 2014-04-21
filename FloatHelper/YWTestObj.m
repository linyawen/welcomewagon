//
//  YWTestObj.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-3.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWTestObj.h"

@implementation YWTestObj

-(id)init{
    self =[super init];
    if (self) {
        NSLog(@"YWTestObj init");
    };
    return self;
}

-(void)dealloc
{
    NSLog(@"YWTestObj dealloc");
}

@end
