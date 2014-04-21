//
//  FloatConfig.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#ifndef FloatAppDemo_FloatConfig_h
#define FloatAppDemo_FloatConfig_h

//当前编译环境是  xcode floatDemo  （0）   还是 Theos  (1)
    #ifndef kPlugins
        #define kPlugins 1
    #endif
//悬浮窗默认Frame
#define kFloatWindowRect CGRectMake(0, 0, 320, 320)
//资源
#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/WelcomeWagonResources.bundle"
#define kDirectory  @"/Library/MobileSubstrate/DynamicLibraries/"




#endif
