//
//  ViewController.h
//  HelloDemo
//
//  Created by Linyw on 14-1-2.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

//#import <UIKit/UIKit.h>

@interface FloatRootViewController : UIViewController
{
    UITableView * _tableview;
    
}
@property (nonatomic,assign) BOOL isPresent;
@property (nonatomic,retain) NSMutableArray * data;

@end
