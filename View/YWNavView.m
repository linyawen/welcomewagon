//
//  YWNavView.m
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-10.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import "YWNavView.h"
#import "../Utils/UIView+Metrics.h"

@implementation YWNavView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UIImageView *)setupLogo
{
    UIImage *img = [UIImage imageNamed:kImage_cocoLogo];
    UIImageView *imgv = [[UIImageView alloc] initWithImage:img];
    imgv.frame = KRect_logo;
    return imgv;
}

-(UILabel *)setupTitle:(NSString *)title
{
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    lblTitle.text = title;
    lblTitle.font = kFont_logo;
    lblTitle.numberOfLines = 1;
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textColor = [UIColor whiteColor];
    [lblTitle sizeToFit];
    return lblTitle;
}

-(YWNavView *)initWithTitle:(NSString *)title
{
    // 计算 frame，动态布局logo跟title
    UIImageView *vLogo = [self setupLogo];
    UILabel *lblTitle = [self setupTitle:title];
    CGFloat deltaHeight = vLogo.height - lblTitle.height;
    CGFloat height = deltaHeight > 0 ? vLogo.height : lblTitle.height;
    CGFloat titleOffset = deltaHeight/2;
    lblTitle.frame = CGRectOffset(lblTitle.frame, vLogo.width + kPadding, titleOffset);
    CGRect frame = CGRectMake(0, 0, [lblTitle right], height);
    // 初始化
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:vLogo];
        [self addSubview:lblTitle];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
