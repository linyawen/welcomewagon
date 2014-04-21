//
//  UIImage+floatApp.m
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "UIImage+floatApp.h"
#import "NSBundle+floatApp.h"

@implementation UIImage (floatApp)


+(UIImage *)f_imageNamed:(NSString *)name
{
    
    NSString *imagePath = [[NSBundle resBundle] pathForResource:name ofType:@"png"];
    if (!imagePath) {
        NSLog(@"imageNotExist: %@",imagePath);
    }else NSLog(@"image exist: %@",imagePath);
    UIImage *imgLogo = [UIImage imageWithContentsOfFile:imagePath];
    return imgLogo;
}


@end
