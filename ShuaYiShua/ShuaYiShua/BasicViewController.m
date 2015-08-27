//
//  BasicViewController.m
//  ShowMessage
//
//  Created by Heguiting on 8/17/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    LOG(@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [super viewDidLoad];
}

-(void)setupAD{
    LOG(@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    ADBannerView *bannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50)];
    [self.view addSubview:bannerView];
}

-(void)showLoginAnimated:(BOOL)animated fromRootViewController:(BOOL)isFrom{
    LOG(@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *navigationLogin = [[UINavigationController alloc]initWithRootViewController:login];
    
    //苹果推荐用根视图控制器去present另一个视图控制器，否则提示Presenting view controllers on detached view controllers is discouraged但是为了介绍页满满消散的效果
    UIViewController *controller;
    if (isFrom) {
        controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    }else{
        controller = self;
    }
    [controller presentViewController:navigationLogin animated:animated completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
