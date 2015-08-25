//
//  NSDate+Translate.h
//  Carousel
//
//  Created by Derick Liu on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Translate)
+ (NSDate*)localDateToServerDate:(NSDate*)localDate;
+ (NSDate*)serverDateToLocalDate:(NSDate*)serverDate;
+ (NSDate*)localDate;
+ (NSDate*)formatterTimeInterval:(NSTimeInterval)timeInterval;
+ (NSString *)formatterNSdate:(NSDate *)formatDate withFormat:(NSString *)formatter;
- (NSInteger)differBetweenTwoNSdate:(NSDate *)anotherDate;
- (BOOL)isBetweenFromStartDate:(NSDate *)startDate toEndDate:(NSDate *)endDate;
@end
