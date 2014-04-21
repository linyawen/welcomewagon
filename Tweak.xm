
#import <SpringBoard/SBApplicationIcon.h>
#import <UIKit/UIKit2.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
//#import "FloatHelper/YWMsgService.h"
//#import "FloatHelper/YWMsgClient.h"
#import "Controller/FloatApp.h"
#import "FloatHelper/FloatHelper.h"


/* * * * * * * * * * * *  * * * * *  Hook  SBApplicationIcon  * * * * * * * * * * * * * */

%hook SBApplicationIcon
//- (void)launchFromLocation:(int)arg1
-(void)launch
{
    %orig;
}
%end

/* * * * * * * * * * * *  * * * * *  Hook  SpringBoard  * * * * * * * * * * * * * */
YWMsgService *msgService = nil;
static UIWindow *globalCoco= nil;
%hook  SpringBoard
-(void)applicationDidFinishLaunching:(id)application
{
    %orig;
    %log;
    NSLog(@"applicationDidFinishLaunching:application");
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"aaaaa" message:@"bbbbbb" delegate:self cancelButtonTitle:@"退出" otherButtonTitles: nil];
//    [alert show];
    msgService = [[YWMsgService alloc] init];
}

//-(void)applicationDidFinishLaunching
//{
//    %orig;
//    %log;
//    NSLog(@"applicationDidFinishLaunching");
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"aaaaa" message:@"bbbbbb" delegate:self cancelButtonTitle:@"退出" otherButtonTitles: nil];
//    [alert show];
//
//    msgService = [[YWMsgService alloc] init];
//}

%end

/* * * * * * * * * * * *  * * * * *  Hook  UIApplication  * * * * * * * * * * * * * */

YWMsgClient * msgClient = nil;
FloatApp *cocoFLoatApp= nil;
@interface UIApplication()
-(void)setupMsgClient;
-(bool)ifAppNeedToHook;
-(void)handleHook;
@end

%hook UIApplication

%new(v@:)
-(void)setupMsgClient
{
    if ( nil == msgClient)
    {
        msgClient = [[YWMsgClient alloc] init];
    };
}

%new(v@:)
-(bool)ifAppNeedToHook
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *name = nil;
    if  (infoDictionary)
        name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
        
    NSLog(@"BundleInfoDictionary : %@",infoDictionary);
    NSLog(@"appName:%@ ",name);
    bool ret = [msgClient sendMsgIfHookAppWithName:name];
    return ret;
}

%new(v@:)
-(void)handleHook
{
    if ( nil == cocoFLoatApp)
    {
        cocoFLoatApp = [FloatApp startFLoatApp];
    };
}

-(void)_reportAppLaunchFinished{
    %orig;
    %log;

    [self setupMsgClient];
    bool ifAppHook = [self ifAppNeedToHook];
    [GlobalFlag shareFlag].ifAppNeedToAddFloatmodul = ifAppHook;
    NSLog(@"needToHook:%d ",ifAppHook);
    if (ifAppHook)
    {
        [self handleHook];
    }else
    {}
}

-(id)init{
    return %orig;
}
%end


/* * * * * * * * * * * *  * * * * *  Hook  UIImage  * * * * * * * * * * * * * */

%hook UIImage
+(UIImage *)imageNamed:(NSString *)name
{
    if ([GlobalFlag shareFlag].ifAppNeedToAddFloatmodul) {
        UIImage * img = [UIImage f_imageNamed:name];
        return img;
    };
    return %orig(name);
}
%end













