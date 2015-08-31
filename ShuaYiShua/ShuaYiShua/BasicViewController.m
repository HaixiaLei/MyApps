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

-(void)showLoginAnimated:(BOOL)animated{
    LOG(@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    if (animated) {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromBottom;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
    }
    [self.navigationController pushViewController:login animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
