//
//  YWMsgClient.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-9.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FloatAppConfig.h"

#if kPlugins
#import <AppSupport/CPDistributedMessagingCenter.h>
#else
#import "../FloatAppDemo/FloatAppDemo/AppSupport/CPDistributedMessagingCenter.h"
#endif







@interface YWMsgClient : NSObject
{
    CPDistributedMessagingCenter *center;
}

-(id)init;
-(NSDictionary *)sendMsgWithName:(NSString *)name withUserInfo:(NSDictionary *)userInfo;

// 询问，是否要hook app
-(BOOL)sendMsgIfHookAppWithName:(NSString *)appname;

@end
