//
//  FloatAppClobalFlag.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalFlag : NSObject


// 是否需要对当前 Hook 的 app增加 coco悬浮模块
@property (nonatomic,assign)BOOL ifAppNeedToAddFloatmodul;


+(GlobalFlag *)shareFlag;
@end
