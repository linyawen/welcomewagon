//
//  YWNavigationController.m
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-11.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import "YWNavigationController.h"


@implementation  UIViewController(YWNavigationKey)

-(NSString *)navigationKey
{
    return NSStringFromClass([self class]);
}
@end


@interface YWNavigationController ()

@end

@implementation YWNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        _viewCtrlMapping = [NSMutableDictionary dictionary];
    };
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _viewCtrlMapping = [NSMutableDictionary dictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *key = nil;
    key = [viewController navigationKey];
    if (key) {
        UIViewController * oldVC = [_viewCtrlMapping objectForKey:key];
        if (oldVC) {
            [self popToViewController:oldVC animated:animated];
            
        }else{
            [_viewCtrlMapping setObject:viewController forKey:key];
            [super pushViewController:viewController animated:animated];
        };
    }else
    {
        [super pushViewController:viewController animated:animated];
    };
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *vctrl = [super popViewControllerAnimated:animated];
    NSString *key = [vctrl navigationKey];
    if (key) {
        [_viewCtrlMapping removeObjectForKey:key];
    };
    return vctrl;
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *key = nil;
    NSArray *arrViewCtrl = [super popToViewController:viewController animated:animated];
    for (UIViewController * vctrl in arrViewCtrl) {
        key = [vctrl navigationKey];
        if (key) {
            [_viewCtrlMapping removeObjectForKey:key];
        };
    };
    return arrViewCtrl;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [_viewCtrlMapping removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

-(void)replaceViewController:(UIViewController *)viewCtrl animated:(BOOL)animated
{
    NSArray *oldVCtrls = [self.viewControllers copy];
    NSMutableArray *newVCtrls = [NSMutableArray array];
    __block UIViewController *vctrlReplaced = nil;
    [oldVCtrls enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx < (oldVCtrls.count - 1)) {
            [newVCtrls addObject:obj];
        }
        else
            vctrlReplaced = obj;
    }];
    [newVCtrls addObject:viewCtrl];
    NSString *key = [vctrlReplaced navigationKey];
    if (key) {
        [_viewCtrlMapping removeObjectForKey:key];
    };
    [self setViewControllers:newVCtrls animated:NO];
    
}


@end
