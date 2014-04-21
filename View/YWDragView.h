//
//  YWMaskWindow.h
//  test2
//
//  Created by Linyw on 13-12-31.
//  Copyright (c) 2013年 Linyw. All rights reserved.
//

//#import <UIKit/UIKit.h>


/**
 *     可以拖动的 view
 *
 */

@class YWDragView;
@protocol YWDragViewDelegate <NSObject>
@required
//用户自定义可移动区域之类的细节
-(BOOL)YWMaskWindowShouldBeginToMove:(YWDragView *)window;
@end

@interface YWDragView : UIView
{
    CGPoint _beginPoint;
@protected
    BOOL _dragEnable;
}

@property (nonatomic,assign)BOOL dragEnable;
@property (nonatomic,weak)id<YWDragViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;
@end
