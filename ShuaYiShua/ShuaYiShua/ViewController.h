//
//  ViewController.h
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroDefinitions.h"
#import "SingleObject.h"
#import "HomePageViewController.h"
#import "IntroduceViewController.h"

@interface ViewController : UIViewController

@property (nonatomic, strong)UINavigationController *homePageNavigationController;
@property (nonatomic, strong)IntroduceViewController *introduceViewController;

@end

