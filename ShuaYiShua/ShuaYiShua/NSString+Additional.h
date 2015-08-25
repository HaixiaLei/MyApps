//
//  NSString+Additional.h
//  ShowMessage
//
//  Created by Heguiting on 8/17/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Additional)

/**
 *  转化为字典
 */
-(NSDictionary *) dictionaryValue;

/**
 *  转化为数组
 */
-(NSArray *) arrayValue;

/**
 *  是否包含string
 */
- (BOOL)containString:(NSString *)target;

/**
 *  获取string在某个状态下的size
 */
-(CGSize)getContentSizeWithFont:(UIFont *)font andWidth:(CGFloat)w andHeight:(CGFloat)h;

@end
