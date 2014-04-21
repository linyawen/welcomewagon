//
//  YWHelperMacro.h
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-24.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#ifndef CocoSDKDemo_YWHelperMacro_h
#define CocoSDKDemo_YWHelperMacro_h


//用于定义一个 局部 weakself, 来打破 block 的 循环引用。
#define YWDefine_WeakSelf(aclass) __weak aclass * weakSelf = self;


//去掉Release时的 NSLog
//#ifdef DEBUG
//#   define NSLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
//#else
//#ifndef NSLog
//#   define NSLog(...)
//#endif
//#endif




#endif
