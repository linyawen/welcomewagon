//
//  UIView+background.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-20.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+background.h"

@interface UIView()
@property (nonatomic,retain)UIImageView * bgImageView;

@end

@implementation UIView (background)

static const char * KeyBackgroundImage = "KeyBackgroundImage";
static const char * KeyBackgroundImageView = "KeyBackgroundImageView";

-(void)setBackgroundImage:(UIImage *)img withFileMode:(UIViewBgImgModeType)mode
{
    UIImageView *imgv = [self bgImageView];
    switch (mode) {
        case UIViewBgImgModeTiled:
        {
            imgv.image = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            [self addSubview:imgv];
            [self sendSubviewToBack:imgv];
            break;
        }
        case UIViewBgImgModeStretch:
        {
            imgv.image = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
            [self addSubview:imgv];
            [self sendSubviewToBack:imgv];
            break;
        }
        default:
            break;
    };
    
    if (img != self.backgroundImage) {
        self.backgroundImage = img;
    };
}


-(UIImageView *)bgImageView
{
    UIImageView *imgv = (UIImageView *)objc_getAssociatedObject(self, KeyBackgroundImageView);
    if ( nil == imgv) {
        imgv = [[UIImageView alloc] initWithFrame:self.bounds];
        objc_setAssociatedObject(self,KeyBackgroundImageView, imgv, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };
    return imgv;
}

-(void)setBgImageView:(UIImageView *)bgImageView
{
    objc_setAssociatedObject(self,KeyBackgroundImageView, bgImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImage *)backgroundImage
{
    UIImage *img = (UIImage *)objc_getAssociatedObject(self, KeyBackgroundImage);
    return img;
}

-(void)setBackgroundImage:(UIImage *)backgroundImage
{
    objc_setAssociatedObject(self,KeyBackgroundImage, backgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:backgroundImage withFileMode:UIViewBgImgModeTiled];
}

@end
