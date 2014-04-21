//
//  UIBarButtonItem+quick.h
//  FloatAppDemo
//
//  Created by Linyw on 14-1-17.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (quick)


/* Convenience creator of UIBarButtomItem
 *  @param imgname0: normal image
 *  @param imgname1: highlight image
 *  @param  target: ....
 *  @param  action: ....
 */
+(UIBarButtonItem *)barButtomItemWithImg0:(NSString *)imgname0
                                 withImg1:(NSString *)imgname1
                                   target:(id)target
                                   action:(SEL)action;


@end
