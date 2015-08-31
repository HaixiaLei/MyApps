//
//  IntroduceViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "IntroduceViewController.h"
#import "HomePageViewController.h"
#import "ViewController.h"

@interface IntroduceViewController ()

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor purpleColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)go:(id)sender {
    LOG(@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    HomePageViewController *home = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    
    id obj = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([obj isKindOfClass:[ViewController class]]) {
        ViewController *viewc = (ViewController *)obj;
        viewc.homePageNavigationController = [[UINavigationController alloc]initWithRootViewController:home];
        viewc.homePageNavigationController.navigationBarHidden = YES;
        [self.view.superview insertSubview:viewc.homePageNavigationController.view belowSubview:self.view];
    }

    [UIView animateWithDuration:0.5 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(-self.view.width, 0);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

@end
