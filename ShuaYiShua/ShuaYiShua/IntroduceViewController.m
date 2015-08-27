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
        [self.view.superview addSubview:viewc.homePageNavigationController.view];
    }
    
    
    
    //动画，让介绍页满满消失
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    [animation setDuration:0.4];
    [animation setDelegate:self];
    animation.removedOnCompletion = YES;
    [self.view.superview.layer addAnimation:animation forKey:@"fade"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.view removeFromSuperview];//动画结束后，移除介绍页
}
@end
