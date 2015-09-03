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

@interface IntroduceViewController (){
    UILabel *blank;
}

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    blank = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    blank.backgroundColor = [UIColor redColor];
    [self.view addSubview:blank];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)go:(id)sender {
     [[SingleObject shared]logUserAction:[NSString stringWithFormat:@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd)]];
    HomePageViewController *home = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    
    id obj = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([obj isKindOfClass:[ViewController class]]) {
        ViewController *viewc = (ViewController *)obj;
        viewc.homePageNavigationController = [[UINavigationController alloc]initWithRootViewController:home];
//        viewc.homePageNavigationController.navigationBarHidden = YES;
        [self.view.superview insertSubview:viewc.homePageNavigationController.view belowSubview:self.view];
    }

    [UIView animateWithDuration:0.5 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(-self.view.width, 0);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
   
//    //测试
//    [blank setFrame:CGRectMake(100, 100, 100, 100)];
//    Point2D start;
//    Point2D end;
//    Point2D control1;
//    Point2D control2;
//    start.x = 0.0;
//    start.y = 0.0;
//    end.x = 1.0;
//    end.y = 1.0;
//    control1.x = 0.75;
//    control1.y = 0.0;
//    control2.x = 1.0;
//    control2.y = 1.0;
//    Point2D p[4] = {start,control1,control2,end};
//    [blank setFrame:CGRectMake(250, 500, 50, 20) withBezier:p curveWithBezier:p isHorizon:NO timeInterval:.5];
}

@end
