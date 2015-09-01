//
//  HomePageViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];


    
    
    
    [self setupAD];
}

-(void)viewDidAppear:(BOOL)animated{
    if (![SingleObject shared].isLogin) {
        [self showLoginAnimated:NO];
    }else{
        
    }
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

- (IBAction)sfdsfbbbbb:(id)sender {
}

- (IBAction)sdfsdfsdf:(id)sender {
}

- (IBAction)loginAction:(UIButton *)sender {
    [self showLoginAnimated:YES];
}
@end
