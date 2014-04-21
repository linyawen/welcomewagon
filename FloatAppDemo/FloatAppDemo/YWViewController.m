//
//  YWViewController.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-2.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWViewController.h"
#import "YWMaskLogo.h"
#import "FloatRootViewController.h"
#import "YWTestObj.h"
#import "AppDelegate.h"


#import "FloatApp.h"

#import "FloatHelper.h"
//#import "YWMsgService.h"
//#import "YWMsgClient.h"


@interface YWViewController ()
{
    UIViewController *_v1;
}
@property (weak, nonatomic) IBOutlet UILabel *lbltest;

@end

@implementation YWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static NSString * path1to = nil;
static NSString * path2to = nil;
static NSString * path3to = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self retainCount];
//    NSString * str = [NSString stringWithFormat:@"release"];
//    [self performSelector:NSSelectorFromString(str) withObject:nil afterDelay:0];
    
//    NSBundle * bundle= [[NSBundle alloc] initWithPath:kBundlePath];
//    NSLog(@"bundle.isLoaded : %d",bundle.isLoaded);
//
//    NSString * pathApp_icon = [bundle pathForResource:@"app_icon" ofType:@"png"];
//    NSLog(@"pathApp_icon : %@",pathApp_icon);
    
    path1to = [NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@",@"WelcomeWagon.dylib"];
    path2to = [NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@",@"WelcomeWagonResources.bundle"];
    path3to = [NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@",@"WelcomeWagon.plist"];
    
    NSLog(@" systemVersion :%@",[[UIDevice currentDevice] systemVersion]);
    
    
}


-(IBAction)actionloadPlugin
{
    NSString * path1 = [[NSBundle mainBundle] pathForResource:@"WelcomeWagon" ofType:nil];
    NSString * path2 = [[NSBundle mainBundle] pathForResource:@"WelcomeWagonResources" ofType:@"bundle"];
    NSString * path3 = [[NSBundle mainBundle] pathForResource:@"WelcomeWagon" ofType:@"plist"];
    
    
    NSFileManager * fMgr = [NSFileManager defaultManager];
    BOOL isSuc1 = [fMgr fileExistsAtPath:path1];
    BOOL isSuc2 = [fMgr fileExistsAtPath:path2];
    BOOL isSuc3 = [fMgr fileExistsAtPath:path3];
    
    
    NSLog(@"path1: %@ ,%d",path1,isSuc1);
    NSLog(@"path2: %@ ,%d",path2,isSuc2);
    NSLog(@"path3: %@ ,%d",path3,isSuc3);
    NSLog(@"path1to: %@",path1to);
    NSLog(@"path2to: %@",path2to);
    
    NSError * error = nil;
    
    if (![self isPluginExist]) {
        BOOL isSuc1 = [[NSFileManager defaultManager] copyItemAtPath:path1 toPath:path1to error:&error];
        NSLog(@"error1 : %@",error);
        BOOL isSuc2 = [[NSFileManager defaultManager] copyItemAtPath:path2 toPath:path2to error:&error];
        NSLog(@"error2 : %@",error);
        BOOL isSuc3 = [[NSFileManager defaultManager] copyItemAtPath:path3 toPath:path3to error:&error];
        NSLog(@"error3 : %@",error);
        NSLog(@" isSuc1 : %d",isSuc1);
        NSLog(@" isSuc2 : %d",isSuc2);
        NSLog(@" isSuc3 : %d",isSuc3);
        if ([self isPluginExist]) {
            self.lbltest.text = @"加载 coco 插件成功，请重启手机生效";
        }else
        {
            self.lbltest.text = @"请重新加载";
        }
    }else
    {
        self.lbltest.text = @" coco 插件已经加载，请重启手机生效";
    };
}


-(IBAction)uninstall:(id)sender
{
    
    NSFileManager * fMgr = [NSFileManager defaultManager];
    
    if ([self isPluginExist]) {
        [fMgr removeItemAtPath:path1to error:nil];
        [fMgr removeItemAtPath:path2to error:nil];
        [fMgr removeItemAtPath:path3to error:nil];
        if (![self isPluginExist]) {
            self.lbltest.text = @"卸载 coco 插件成功，请重启手机生效";
        }else{
            self.lbltest.text = @"请重新加载";
        };
    }else{
        self.lbltest.text = @" coco 插件已经卸载，请重启手机生效";
    };
}

-(BOOL)isPluginExist
{
    NSFileManager * fMgr = [NSFileManager defaultManager];
    BOOL isSuc1 = [fMgr fileExistsAtPath:path1to];
    BOOL isSuc2 = [fMgr fileExistsAtPath:path2to];
    BOOL isSuc3 = [fMgr fileExistsAtPath:path3to];
    return isSuc1&&isSuc2&&isSuc3;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self performSelector:@selector(loadFloatApp) withObject:nil afterDelay:1.5];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (IBAction)actionBtn:(id)sender {

    
//    NSBundle * bundle = [NSBundle mainBundle];
//    
//    NSString * bdlPath = [bundle bundlePath];
//    NSString * resPath = [bundle resourcePath];
//    NSString * exePath = [bundle executablePath];
//    NSString * auxiliaryPath = [bundle resourcePath];
//    
//    NSLog(@" boundle path: %@",bdlPath);
//    NSLog(@" resourcePath path: %@",resPath);
//    NSLog(@" executablePath path: %@",exePath);
//    NSLog(@" auxiliaryPath path: %@",auxiliaryPath);
//    
//    
//    NSArray * arraySub = [[NSFileManager defaultManager] subpathsAtPath:bdlPath];
//    NSLog(@" arraySub: %@ ",arraySub);
}

- (IBAction)actiontest:(id)sender {
    
    NSMutableArray * arrayData = [[NSMutableArray alloc] init];
    [arrayData addObject:@"obj0"];
    [arrayData addObject:@"obj1"];
    [arrayData addObject:@"obj2"];
    NSString * testPath = [NSString stringWithFormat:@"/Library/testfile.plist"];
    NSLog(@"testPath : %@",testPath);
    BOOL isSucc = [arrayData writeToFile:testPath atomically:YES];
    NSLog(@"isSucc : %d",isSucc);

    NSDictionary *ret = nil;
    
}

-(void)dealloc
{
    NSLog(@"dealloc");
}


//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight;
//}
//
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
    toInterfaceOrientation == UIInterfaceOrientationLandscapeRight;
}



-(void)loadFloatApp
{
    [FloatApp startFLoatApp];
}




@end
