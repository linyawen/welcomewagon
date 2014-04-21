//
//  YWInputDelegate.h
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-13.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWTextFieldInputDelegate : NSObject<UITextFieldDelegate>
{
    NSInteger _maxLength;
}

// 初始化
//@param length: TextField 允许输入的最大长度
-(id)initWithMaxLength:(NSInteger )length;

@end
