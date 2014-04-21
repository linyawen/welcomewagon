//
//  YWMsgService.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-9.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <Foundation/Foundation.h>

#if kPlugins
#import <AppSupport/CPDistributedMessagingCenter.h>
#else
#import "../FloatAppDemo/FloatAppDemo/AppSupport/CPDistributedMessagingCenter.h"
#endif




#define YWMsgServiceName @"com.Chukong.MsgService"
#define YWMsgName(_msg)  [NSString stringWithFormat:@"%@.%@",YWMsgServiceName,_msg]

// 消息: 是否hook 某个app
#define YWMsg_ifHookApp YWMsgName(@"ifHookApp")



@interface YWMsgService : NSObject
{
    CPDistributedMessagingCenter *center;
    NSMutableArray * _hookAppsFilter;
}

@property (nonatomic,copy )NSString * appName;

-(id)init;
//加载需要 hook 的 app
-(void)loadAppsForHook;

//统一的响应消息入口
- (NSDictionary *)handleMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userinfo;

//响应消息
-(BOOL)handleMsg_ifHookApp:(NSString *)appname;

@end
