//
//  ViewController.m
//  YYBiliBiliLaunchDemo
//
//  Created by yy on 2017/8/29.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 20)];
    title.text = @"这里是主页";
    [self.view addSubview:title];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
