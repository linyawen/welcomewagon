//
//  YWInputDelegate.m
//  CocoSDKDemo
//
//  Created by Linyw on 13-12-13.
//  Copyright (c) 2013年 CocoaChina. All rights reserved.
//

#import "YWTextFieldInputDelegate.h"

static NSString * kEnInput = @"en-US";
static NSString * kZhInput = @"zh-Hans";
static NSString * kEmojiInput = @"emoji";

@implementation YWTextFieldInputDelegate

#pragma mark - UITextFieldDelegate

-(id)initWithMaxLength:(NSInteger)length
{
    self = [super init];
    if (self) {
        _maxLength = length;
    };
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    [textField resignFirstResponder];
    return YES;
}
// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    NSLog(@"textFieldDidBeginEditing");
};
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
//    NSLog(@"textFieldShouldEndEditing");
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    NSLog(@"textFieldDidEndEditing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextInputMode *inputMode = [UITextInputMode currentInputMode];
    NSString * priLanguage = [inputMode primaryLanguage];
    if ([priLanguage isEqualToString: kEnInput]) {
        if (range.location >= _maxLength )
            return NO;
        else return YES;
    }
    else if ([priLanguage isEqualToString:kZhInput])
    {
        if (range.length > 0) {
            //此时正在输入中文，打完拼音字母，点选了对应的词组时触发
            NSMutableString *rawtext = [[NSMutableString alloc] initWithString:textField.text];
            [rawtext replaceCharactersInRange:range withString:string];
            NSInteger newLength = [rawtext length];
            NSString *strCut = nil;
            if (newLength > _maxLength)
            {
                strCut = [rawtext substringToIndex:_maxLength];
                textField.text = strCut;
                return NO;
            };
            return YES;
        }else if (range.length == 0)
        {
            //此时正在输入中文，正在输入拼音字母ing,这时候不对长度进行限制。
            return YES;
        };
    };
    return YES;
}

@end
