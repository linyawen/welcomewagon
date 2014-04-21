//
//  YWMsgService.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-9.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWMsgService.h"

@implementation YWMsgService

-(id)init{
    if (self = [super init]) {
        [self setupMsgCenter];
        [self loadAppsForHook];
        NSLog(@"YWMsgService init");
    };
    return self;
}

-(void)setupMsgCenter
{
    center = [CPDistributedMessagingCenter centerNamed:YWMsgServiceName];
    [center runServerOnCurrentThread];
    [center registerForMessageName:YWMsg_ifHookApp target:self selector:@selector(handleMessageNamed:withUserInfo:)];
}

-(void)loadAppsForHook
{
    _hookAppsFilter = [NSMutableArray array];
    [_hookAppsFilter addObject:@"通讯录"];
    [_hookAppsFilter addObject:@"网易公开课"];
    [_hookAppsFilter addObject:@"CarrotFantasy"];
}

- (NSDictionary *)handleMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userinfo {
    NSLog(@"handleMessageNamed:%@,%@",name,userinfo);
    NSMutableDictionary *dicRet = nil;
    if ([name isEqualToString:YWMsg_ifHookApp]) {
        NSString *appname = [userinfo objectForKey:@"kAppName"];
        BOOL blnIfHook = [self handleMsg_ifHookApp:appname];
        dicRet = [NSMutableDictionary dictionary];
        [dicRet setObject:[NSNumber numberWithBool:blnIfHook] forKey:@"kResult"];
        NSLog(@"debug4: %@",dicRet);
        return dicRet;
    };
    return dicRet;
}

-(BOOL)handleMsg_ifHookApp:(NSString *)appname
{
    BOOL blnRet = NO;
    for (NSString *name in _hookAppsFilter) {
        NSLog(@"name:%@-%@",name,appname);
        if ([appname rangeOfString:name].length) {
            blnRet = YES;
            break;
        }
    };
//    return YES;
    NSLog(@"handleMsg_ifHookApp: %@,return : %d",appname,blnRet);
    return blnRet;
}

-(void)dealloc
{
    NSLog(@"YWMsgService dealloc");
}

@end
