//
//  AppDelegate.m
//  YYBiliBiliLaunchDemo
//
//  Created by yy on 2017/8/29.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "AppDelegate.h"
#import "UIViewController+ControllerInit.h"
#import "LaunchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [LaunchViewController controller];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
