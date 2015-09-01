//
//  LoginViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/27/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "LoginViewController.h"
#import "MacroDefinitions.h"
#import "SingleObject.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(UIButton *)sender {
     [[SingleObject shared]logUserAction:[NSString stringWithFormat:@"%@触发方法：%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd)]];
    [SingleObject shared].isLogin = YES;
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
@end
