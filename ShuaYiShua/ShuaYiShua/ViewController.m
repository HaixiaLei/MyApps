//
//  ViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"

#define VERSION_BUILD @"version_build"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SingleObject shared].isIntroduceForcedToShow = YES;//强制进入介绍页

    //判断version和build
    NSString *versionBuild_old = [[NSUserDefaults standardUserDefaults]objectForKey:VERSION_BUILD];
    NSString *versionBuild_now = [APP_VERSION stringByAppendingString:APP_BUILD];
    if ([versionBuild_now isEqualToString:versionBuild_old] && ![SingleObject shared].isIntroduceForcedToShow) {
        HomePageViewController *homePage = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
        self.homePageNavigationController = [[UINavigationController alloc]initWithRootViewController:homePage];
        self.homePageNavigationController.navigationBarHidden = YES;
        [self.view addSubview:self.homePageNavigationController.view];
    }else{
        self.introduceViewController = [[IntroduceViewController alloc]initWithNibName:@"IntroduceViewController" bundle:nil];
        [self.introduceViewController.view setFrame:self.view.bounds];
        [self.view addSubview:self.introduceViewController.view];
        
        [[NSUserDefaults standardUserDefaults]setObject:versionBuild_now forKey:VERSION_BUILD];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

