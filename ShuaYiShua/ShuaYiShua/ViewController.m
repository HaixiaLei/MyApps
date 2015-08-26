//
//  ViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewController.h"
#import "IntroduceViewController.h"

#define VERSION_BUILD @"version_build"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //判断version和build
    NSString *versionBuild_old = [[NSUserDefaults standardUserDefaults]objectForKey:VERSION_BUILD];
    NSString *versionBuild_now = [APP_VERSION stringByAppendingString:APP_BUILD];
    if ([versionBuild_now isEqualToString:versionBuild_old] && ![SingleObject shared].isIntroduceForcedToShow) {
        LOG(@"进入首页HomePageViewController");
        HomePageViewController *homePage = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
        [self.navigationController pushViewController:homePage animated:NO];
        
    }else{
        LOG(@"进入介绍页IntroduceViewController");
        IntroduceViewController *introduce = [[IntroduceViewController alloc]initWithNibName:@"IntroduceViewController" bundle:nil];
        [self.navigationController pushViewController:introduce animated:NO];
        
        [[NSUserDefaults standardUserDefaults]setObject:versionBuild_now forKey:VERSION_BUILD];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

