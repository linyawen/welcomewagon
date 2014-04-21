//
//  UIViewController+floatApp.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-14.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import "../FloatHelper/FloatHelper.h"
#import "../Controller/FloatApp.h"
#import "../Utils/Utils.h"


#define kDuration   0.25
#define kAnnimationPresent  @"kAnnimationPresent"
#define kAnnimationDismiss  @"kAnnimationDismiss"


/* * * * * * * * * * * * * * * *  Add ViewController to FloatApp   * * * * * * * * * * * * * * * */
#pragma mark - FloatApp
@interface FloatApp(PresentViewController)
-(void)presentVCtrl:(UIViewController *)vctrl;
@end
@implementation FloatApp(PresentViewController)
-(void)presentVCtrl:(UIViewController *)vctrl
{
    [[FloatApp shareFloatApp].view addSubview:vctrl.view];
    [[FloatApp shareFloatApp] addChildViewController:vctrl];
}
@end
/* * * * * * * * * * * * * * * *  add  Runtime  Property  * * * * * * * * * * * * * * * */

#pragma mark - addRuntimeProperty
typedef void(^tCompletion)(void);

@interface UIViewController(addRuntimeProperty)

// 该UIViewController是否在悬浮界面下presentFloatViewController 出来的
@property (nonatomic,assign)BOOL isPresentedFloat;
// 当前执行的动画名字: 1, present 2, dismiss
@property (nonatomic,retain)NSString *annimationName;
//动画执行完毕的block
@property (nonatomic,copy) tCompletion callbackBlock;
@end

static const char * KeyIsFloatViewController = "KeyIsFloatViewController";
static const char * KeyAnnimationName = "KeyAnnimationType";
static const char * KeyCallbackBlock = "KeyCallbackBlock";
static const char * KeyPresentedViewController = "keyPresentedViewController";
static const char * KeyPresentingViewController = "KeyPresentingViewController";


@implementation UIViewController(addRuntimeProperty)

-(BOOL)isPresentedFloat
{
    NSNumber *isFloatApp = (NSNumber*)objc_getAssociatedObject(self, KeyIsFloatViewController);
    
    if(isFloatApp == nil)
    {
        isFloatApp = [[NSNumber alloc] initWithBool:NO];
        objc_setAssociatedObject(self,KeyIsFloatViewController, isFloatApp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return NO;
    }else
    {
        return [isFloatApp boolValue];
    };
}

-(void)setIsPresentedFloat:(BOOL)yesOrNo
{
    NSNumber *blnYesOrNo = [[NSNumber alloc] initWithBool:yesOrNo];
    objc_setAssociatedObject(self, KeyIsFloatViewController, blnYesOrNo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)annimationName
{
    NSString *name= (NSString*)objc_getAssociatedObject(self, KeyAnnimationName);
    return name;
}

-(void)setAnnimationName:(NSString *)name
{
  objc_setAssociatedObject(self,KeyAnnimationName, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(tCompletion )callbackBlock
{
    tCompletion  callback = (tCompletion)objc_getAssociatedObject(self, KeyCallbackBlock);
    return callback;
}

-(void)setCallbackBlock:(tCompletion ) callback
{
    objc_setAssociatedObject(self,KeyCallbackBlock, callback, OBJC_ASSOCIATION_COPY);
}

@end


/* * * * * * * * * * * *    present ViewController  /   dismiss   ViewController    * * * * * * * * * * */
#pragma mark -  present   /   dismiss  

@implementation UIViewController (floatApp)

/*
 *  找到真正被present 出来的 UIViewcontroller，
 * （因为调用 dismiss的可能是某个父容器下面的子UIViewController）
 */
-(UIViewController *)realPresentedViewController
{
    if ([self isKindOfClass:[FloatApp class]])
    {
        return nil;
    };
    if (self.isPresentedFloat) {
        return self;
    }else{
        UIViewController *parentVCtrl = self.parentViewController;
        if (nil == parentVCtrl)
            return nil;
        else
            return [parentVCtrl realPresentedViewController];
    };
}

-(UIViewController *)flPresentedViewController
{
    UIViewController *vctrl= (UIViewController*)objc_getAssociatedObject(self, KeyPresentedViewController);
    return vctrl;
}

-(void)setFlPresentedViewController:(UIViewController *)vctrl
{
    objc_setAssociatedObject(self,KeyPresentedViewController, vctrl, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController *)flPresentingViewController
{
    //递归取
    UIViewController *vctrl= (UIViewController*)objc_getAssociatedObject(self, KeyPresentingViewController);
    if (vctrl)
        return vctrl;
    if(!vctrl) {
        UIViewController *parentVCtrl =  self.parentViewController;
        if (nil == parentVCtrl) {
            return nil;
        };
        if ([parentVCtrl isKindOfClass:[FloatApp class]]) {
            return nil;
        };
        vctrl = parentVCtrl.flPresentingViewController;
    };
    return vctrl;
}

-(void)setFlPresentingViewController:(UIViewController *)f_presentingViewController
{
    objc_setAssociatedObject(self,KeyPresentingViewController, f_presentingViewController, OBJC_ASSOCIATION_ASSIGN);
}

-(void)flPresentViewController:(UIViewController *)viewControllerToPresent
                         animated:(BOOL)flag
                       completion:(void (^)(void))completion
{
    [self.view hideKeyBoard];
    viewControllerToPresent.isPresentedFloat = YES;
    self.flPresentedViewController = viewControllerToPresent;
    viewControllerToPresent.flPresentingViewController = self;
    
    // 考虑在 floatapp 重新封装添加子UIViewController 封装
    CGRect floatAppBounds = [[FloatApp shareFloatApp] floatScreenBounds];
    viewControllerToPresent.view.frame = floatAppBounds;
    [[FloatApp shareFloatApp] presentVCtrl:viewControllerToPresent];
    
    self.annimationName = kAnnimationPresent;
    self.callbackBlock = completion;
    
    if (flag) {
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = kCATransitionMoveIn;
        animation.subtype = kCATransitionFromTop;
        [viewControllerToPresent.view.layer addAnimation:animation forKey:@"presentAnimation"];
    }else
    {
        [self viewWillDisappear:NO];
        self.callbackBlock();
        [self viewDidDisappear:NO];
    };
}

-(void)flDismissViewControllerAnimated: (BOOL)flag
                          completion: (void (^)(void))completion
{
    if (!self.flPresentingViewController)
        return;
    [self.view hideKeyBoard];
    UIViewController * dimissVCtrl = [self realPresentedViewController];
    dimissVCtrl.view.hidden = YES;
    
    self.annimationName = kAnnimationDismiss;
    self.callbackBlock = completion;
    if (flag) {
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFromBottom;
        [dimissVCtrl.view.layer addAnimation:animation forKey:@"dsmissAnimation"];
    }else
    {
        [self.flPresentingViewController viewWillAppear:NO];
        [self.flPresentingViewController viewDidAppear:NO];
        self.callbackBlock();
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        
    };
}

#pragma mark - Delegate of CAAnimation
#pragma mark   Begin
- (void)animationDidStart:(CAAnimation *)anim
{
    if ([self.annimationName isEqualToString:kAnnimationDismiss]) {
        
        //下面的viewController viewWillappear;
        [self.flPresentingViewController viewWillAppear:YES];
    }else if ([self.annimationName isEqualToString:kAnnimationPresent])
    {
        [self viewWillDisappear:YES];
    };
}

#pragma mark   End
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.callbackBlock();
    if ([self.annimationName isEqualToString:kAnnimationDismiss]) {
        UIViewController * vCtrl = [self realPresentedViewController];
        if (vCtrl) {
            [vCtrl removeFromParentViewController];
            [vCtrl.view removeFromSuperview];
        }else NSLog(@"float dismiss 逻辑错误");
        [self.flPresentingViewController viewDidAppear:YES];
    }
    else if ([self.annimationName isEqualToString:kAnnimationPresent])
    {
        [self viewDidDisappear:YES];
    };
}

@end






