//
//  YWMaskLogo.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-2.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "YWMaskLogo.h"
#import "../FloatHelper/FloatHelper.h"
//#import "UIImage+floatApp.h"

@interface YWMaskLogo()
{
    UILabel * _lbltitle;
    NSInteger _count;   // 测试用.
    NSTimer *_timer;
}


@end


@implementation YWMaskLogo

-(id)init
{
    self = [self initWithFrame:kMaskLogoRect];
    if (self) {
        // sth else by default
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _count = 0;
        _dragEnable = YES;
        
        // UITapGestureRecognizer
        [self setupTap];
        // title
//        [self setupLabel];
        // 计数timer
//        [self setupCounter];
    }
    return self;
}

-(id)initWithUIImage:(UIImage *)image
{
//    self = [super init];
    self = [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if (self) {
        UIImageView *imgv = [[UIImageView alloc] initWithImage:image];
//        CGRect imgframe = imgv.frame;
//        self.bounds = imgframe;
        [self addSubview:imgv];
    }
    return self;
}

-(id)initWithUIImage:(UIImage *)image withFrame:(CGRect) frame;
{
    self = [super init];
    if (self) {
        UIImageView *imgv = [[UIImageView alloc] initWithImage:image];
        imgv.frame = frame;
        self.bounds = frame;
        [self addSubview:imgv];
    }
    return self;
}

-(void)setupTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

-(void)setupLabel
{
    _lbltitle = [[UILabel alloc] initWithFrame:self.bounds];
    _lbltitle.text = @"Coco";
    //        [_lbltitle sizeToFit];
    _lbltitle.adjustsFontSizeToFitWidth = YES;
    _lbltitle.backgroundColor = [UIColor clearColor];
    _lbltitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_lbltitle];
}

-(void)setupCounter
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handerTimer:) userInfo:nil repeats:YES];
//    [_timer fire];
}

-(void)setTapCallback:(MaskTapBlock)block
{
    self.tapblock = block;
}

-(void)actionTap
{
    NSLog(@"CocoLogo click");
//    YWTestObj *obj = [[YWTestObj alloc] init];
    if (self.tapblock) {
//        _open = !_open;
        self.tapblock(self);
    };
//    [obj release];
}

-(void)handerTimer:(NSTimer *)timer
{
    _count ++;
    NSString *str = [NSString stringWithFormat:@"Coco (%d)",_count];
    _lbltitle.text = str;
    _lbltitle.numberOfLines = 2;
    _lbltitle.lineBreakMode = NSLineBreakByWordWrapping;
}

+(YWMaskLogo *)maskLogoView
{
    UIImage *imgLogo = [UIImage imageNamed:@"app_icon"];
    YWMaskLogo *logo = [[YWMaskLogo alloc] initWithUIImage:imgLogo withFrame:kMaskLogoRect];
    logo.dragEnable = YES;
    return logo;
}

+(YWMaskLogo *)shareWindow
{
    static YWMaskLogo *win = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        win = [YWMaskLogo maskLogoView];
        win.backgroundColor = [UIColor redColor];
        win.alpha = 0.6;
    });
    return win;
}

@end
