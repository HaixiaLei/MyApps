//
//  IntroduceViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "IntroduceViewController.h"
#import "HomePageViewController.h"

@interface IntroduceViewController ()

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)go:(id)sender {
    LOG(@"从介绍页面进入首页HomePageViewController");
    HomePageViewController *home = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
}
@end
