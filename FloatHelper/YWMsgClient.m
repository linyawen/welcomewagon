//
//  YWMsgClient.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-9.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWMsgClient.h"
#import "YWMsgService.h"

@implementation YWMsgClient

-(id)init{
    if (self = [super init]) {
        center = [CPDistributedMessagingCenter centerNamed:YWMsgServiceName];
        NSLog(@"YWMsgClient init");
    };
    return self;
}

-(NSDictionary *)sendMsgWithName:(NSString *)name withUserInfo :(NSDictionary *)userInfo
{
    NSDictionary *ret = nil;
    ret = [center sendMessageAndReceiveReplyName:name userInfo:userInfo];
    return ret;
}

-(BOOL)sendMsgIfHookAppWithName:(NSString *)appname
{
    BOOL blnIfHook = false;
    if ( nil != appname && NULL != appname) {
        NSDictionary *ret = nil;
        NSDictionary * paramInfo = [NSDictionary dictionaryWithObject:appname forKey:@"kAppName"];
        ret = [self sendMsgWithName:YWMsg_ifHookApp withUserInfo:paramInfo];
        NSLog(@" sendMsgIfHookAppWithName :%@ ,ret: %@",appname,ret);
        blnIfHook = [[ret objectForKey:@"kResult"] boolValue];
    };
    return blnIfHook;
}

-(void)dealloc
{
    NSLog(@"YWMsgClient dealloc");
}


@end
