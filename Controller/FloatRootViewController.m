//
//  ViewController.m
//  HelloDemo
//
//  Created by Linyw on 14-1-2.
//  Copyright (c) 2014年 Linyw. All rights reserved.
//

#import "FloatRootViewController.h"
#import "../FloatHelper/FloatHelper.h"

@interface FloatRootViewController ()
<UITableViewDataSource,UITableViewDelegate>
{

    
}

@end

static NSInteger idx = 1;

@implementation FloatRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self setupUI];
     NSLog(@"floatRootViewController init");
}

/*
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear : %@",self);
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear : %@",self);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear : %@",self);
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear : %@",self);
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    self.view = [[UIView alloc] initWithFrame:kFloatWindowRect];
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|
                                    UIViewAutoresizingFlexibleWidth|
                                UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dataitem = _data[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    
    [cell viewWithTag:1];
    
    return cell;
}

-(void)setupUI
{
    self.navigationItem.title = [NSString stringWithFormat:@"view : %d",idx++];
    
    UILabel *lblWeChat = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 110, 21)];
    lblWeChat.text = @"微信";
    UISwitch *swWechat = [[UISwitch alloc] initWithFrame:CGRectMake(168, 16, 79, 27)];
    
    UILabel *lblOpenCourse = [[UILabel alloc] initWithFrame:CGRectMake(20, 63, 110, 21)];
    lblOpenCourse.text = @"网易公开课";
    UISwitch *swOpenCourse = [[UISwitch alloc] initWithFrame:CGRectMake(168, 57, 79, 27)];
    
    [swWechat addTarget:self action:@selector(valuechange1) forControlEvents:UIControlEventValueChanged];
    [swOpenCourse addTarget:self action:@selector(valuechange) forControlEvents:UIControlEventValueChanged];
    
    
    UILabel *lblBottom = [[UILabel alloc] initWithFrame:CGRectMake(20,300, 110,20)];
    lblBottom.text = @"这是底部";
    lblBottom.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    lblBottom.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:lblWeChat];
    [self.view addSubview:swWechat];
    [self.view addSubview:lblOpenCourse];
    [self.view addSubview:swOpenCourse];
    [self.view addSubview:lblBottom];
    
    UIBarButtonItem *btnRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = btnRight;
    
    if (self.isPresent) {
        UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithTitle:@"dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
        self.navigationItem.leftBarButtonItem = btnLeft;
    }else
    {
//        UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithTitle:@"pop" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
//        self.navigationItem.leftBarButtonItem = btnLeft;
    }
}

-(void)leftAction
{
    NSLog(@"viewcontroller idx leftAction: %d",idx);
    if (self.isPresent) {
        [self flDismissViewControllerAnimated:YES completion:^{
            NSLog(@"dismiss completion");
        }];
    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)rightAction
{
    NSLog(@"viewcontroller idx rightAction: %d",idx);
    FloatRootViewController * newvc = [[FloatRootViewController alloc] init];
    newvc.isPresent = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newvc];
    
    newvc.view.backgroundColor = [UIColor blueColor];
    
    NSLog(@"%@:title %@,rightAction",self,self.navigationItem.title);
    [self flPresentViewController:nav animated:YES completion:^{
//        NSLog(@"present completion : %@",self);
    }];
}

-(void)action
{
    FloatRootViewController * newvc = [[FloatRootViewController alloc] init];
    [self.navigationController pushViewController:newvc animated:YES];
}

-(void)valuechange1
{
    [self flDismissViewControllerAnimated:NO completion:^{
        NSLog(@"dismiss completion : %@",self);
    }];
}

-(void)valuechange
{
    FloatRootViewController * newvc = [[FloatRootViewController alloc] init];
//    newvc.isPresent = NO;
    NSLog(@"viewcontroller idx valuechange: %d",idx);
    newvc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:newvc animated:YES];
}

-(void)loadData
{
    [_data addObject:@{@"kName":@"微信",@"kValue":@0}];
    [_data addObject:@{@"kName":@"网易公开课",@"kValue":@0}];
}

-(void)dealloc
{
    NSLog(@"floatRootViewController dealloc");
}

@end








