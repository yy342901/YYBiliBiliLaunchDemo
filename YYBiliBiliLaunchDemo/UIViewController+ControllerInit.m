//
//  UIViewController+ControllerInit.m
//  YYBiliBiliLaunchDemo
//
//  Created by yy on 2017/8/29.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "UIViewController+ControllerInit.h"
#import <objc/Object.h>

@implementation UIViewController (ControllerInit)

+ (void)load{
    
    Method method1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod(self, @selector(yp_Hook_dealloc));
    method_exchangeImplementations(method1, method2);
}

- (void)yp_Hook_dealloc{
    
    NSLog(@"%@ %@ 被释放了",self, NSStringFromClass([self class]));
    [self yp_Hook_dealloc];
}



+ (instancetype)controller{
    
    UIViewController* controller = [[self alloc] init];
    return controller;
}
@end
