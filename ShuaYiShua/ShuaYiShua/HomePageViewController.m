//
//  HomePageViewController.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "HomePageViewController.h"
#import "NSMutableAttributedString+Additional.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //测试NSMutableAttributedString+Additional
    NSMutableAttributedString *maString = [[NSMutableAttributedString alloc]initWithString:@"HEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！\nHEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！\nHEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！HEllo,World!你好吗？WO狠好！"];
    [maString setFont:[UIFont italicSystemFontOfSize:36] inRange:NSMakeRange(0, 2)];
    [maString setFont:[UIFont systemFontOfSize:28] inRange:NSMakeRange(1, 2)];
    [maString setFont:[UIFont systemFontOfSize:17] inRange:NSMakeRange(6, maString.length-6)];
    [maString setForegroundColor:[UIColor redColor] inRange:NSMakeRange(2, 2)];
    [maString setBackgroundColor:[UIColor yellowColor] inRange:NSMakeRange(3, 2)];
    [maString setLineSpacing:5];
    [maString setParagraphSpacing:15];
    [maString setKerning:30 inRange:NSMakeRange(5, 10)];
    [maString setStrikethroughStyle:NSUnderlineStyleDouble color:[UIColor redColor] inRange:NSMakeRange(10, 5)];
    [maString setUnderlineStyle:NSUnderlineStyleSingle color:[UIColor purpleColor] inRange:NSMakeRange(13, 5)];
    [maString setStrokeColor:[UIColor greenColor] width:4 inRange:NSMakeRange(16, 8)];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;
    shadow.shadowColor = [UIColor blueColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    [maString setShadow:shadow inRange:NSMakeRange(22, 150)];
    [maString setVerticalGlyphForm:@0 inRange:NSMakeRange(30, 40)];
    [maString setObliqueness:@1 inRange:NSMakeRange(60, 40)];
    [maString setExpansion:@1 inRange:NSMakeRange(90, 40)];
    
    UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, 300, 400)];
    tv.backgroundColor = [UIColor lightGrayColor];
    [tv setAttributedText:maString];
    tv.editable = NO;
    [self.view addSubview:tv];
    

    
    
    
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
