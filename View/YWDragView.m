//
//  YWMaskWindow.m
//  test2
//
//  Created by Linyw on 13-12-31.
//  Copyright (c) 2013年 Linyw. All rights reserved.
//

#import "YWDragView.h"

@interface YWDragView()

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@implementation YWDragView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dragEnable = NO;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    _beginPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragEnable) {
        return;
    }
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint nowPoint = [touch locationInView:self];
    
    
    
    float offsetX = nowPoint.x - _beginPoint.x;
    float offsetY = nowPoint.y - _beginPoint.y;
    CGPoint nextPt = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    if ( [self pointValid:nextPt]) {
        self.center = nextPt;
        return;
    };
    nextPt = CGPointMake(self.center.x, self.center.y + offsetY);
    if ([self pointValid:nextPt]) {
        self.center = nextPt;
        return;
    };
    nextPt = CGPointMake(self.center.x+ offsetX, self.center.y);
    if ([self pointValid:nextPt]) {
        self.center = nextPt;
        return;
    };
}

-(BOOL)pointValid:(CGPoint )pt
{
    CGRect superFrame = self.superview.bounds;
    CGRect selfFrame = self.bounds;
    CGRect centerMoveArea = CGRectMake(selfFrame.size.width/2, selfFrame.size.height/2, superFrame.size.width-selfFrame.size.width, superFrame.size.height-selfFrame.size.height);
    return CGRectContainsPoint(centerMoveArea, pt);
}



@end
