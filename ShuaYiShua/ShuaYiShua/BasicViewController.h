//
//  BasicViewController.h
//  ShowMessage
//
//  Created by Heguiting on 8/17/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "UIView+Additional.h"
#import "NSArray+Additional.h"
#import "NSDictionary+Additional.h"
#import "NSString+Additional.h"
#import "UIImage+Additional.h"
#import "MacroDefinitions.h"
#import "SingleObject.h"
#import "LoginViewController.h"

@interface BasicViewController : UIViewController

-(void)setupAD;
-(void)showLoginAnimated:(BOOL)animated;

@end
