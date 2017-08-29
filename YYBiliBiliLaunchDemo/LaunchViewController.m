//
//  LaunchViewController.m
//  YYBiliBiliLaunchDemo
//
//  Created by yy on 2017/8/29.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "LaunchViewController.h"
#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface LaunchViewController ()
/** 背景加载图片 */
@property (strong, nonatomic)UIImageView *bgImageView;

/** 启动图片ImageView */
@property (strong, nonatomic)UIImageView *splashImageView;


@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置UI
    [self setupUI];
    
}

-(void)setupUI{
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.splashImageView];
    [self.splashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@0);
        make.height.equalTo(@0);
        make.centerX.mas_equalTo(self.bgImageView.mas_centerX);
         make.centerY.mas_equalTo(self.bgImageView.mas_centerY);
    }];
    
    //设置锚点
    self.splashImageView.layer.anchorPoint = CGPointMake(0.5, 0.8);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self launchWithAnimationFunc];

    });
}

-(void)launchWithAnimationFunc{
    
    [self.splashImageView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.width.equalTo(@220);
         make.height.equalTo(@320);
    }];
   
    
    
    [UIView animateWithDuration:1.5f delay:0.5f usingSpringWithDamping:0.4f initialSpringVelocity:8.0f options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                [UIApplication sharedApplication].keyWindow.rootViewController = [[ViewController alloc]init];
                [[UIApplication sharedApplication].keyWindow sendSubviewToBack:[UIApplication sharedApplication].keyWindow.rootViewController.view];
            }];
        });
    }];

}


#pragma mark - lazy Load
-(UIImageView*)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _bgImageView.image = [UIImage imageNamed:@"launchBg"];
    }
    return _bgImageView;
}
-(UIImageView*)splashImageView{
    if (!_splashImageView) {
        _splashImageView = [UIImageView new];
        _splashImageView.image = [UIImage imageNamed:@"bilibili_splash_default_2"];
        
    }
    return _splashImageView;
}
@end
