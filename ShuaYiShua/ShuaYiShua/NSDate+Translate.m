//
//  NSDate+Translate.m
//  Carousel
//
//  Created by Derick Liu on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Translate.h"

@implementation NSDate (Translate)
#pragma mark-
+ (NSDateFormatter *)dateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return dateFormatter;
}

+ (NSDate *)localDateToServerDate:(NSDate *)localDate{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:localDate];
    NSDate *serverDate = [localDate  dateByAddingTimeInterval: -interval]; 
    return serverDate;
}

+ (NSDate *)serverDateToLocalDate:(NSDate *)serverDate{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:serverDate];
    NSDate *localeDate = [serverDate  dateByAddingTimeInterval: interval];
    return localeDate;
}

+ (NSDate *)localDate{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}

+ (NSDate *)formatterTimeInterval:(NSTimeInterval)timeInterval
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return  [NSDate dateWithTimeIntervalSince1970: timeInterval];
}

+ (NSString *)formatterNSdate:(NSDate *)formatDate withFormat:(NSString *)formatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:formatDate];
}

- (NSInteger)differBetweenTwoNSdate:(NSDate *)anotherDate
{
    NSTimeInterval lastDiff = [anotherDate timeIntervalSinceNow];
    NSTimeInterval todaysDiff = [self timeIntervalSinceNow];
    NSTimeInterval dateDiff = lastDiff - todaysDiff;
    return dateDiff/60/60/24 + 1;
}

- (BOOL)isBetweenFromStartDate:(NSDate *)startDate toEndDate:(NSDate *)endDate
{
    BOOL between = NO;
    if (([self compare:startDate] == NSOrderedDescending) &&
        ([self compare:endDate] == NSOrderedAscending)) {
        between = YES;
    }else if([self compare:startDate] == NSOrderedSame){
        between = YES;
    }else if([self compare:endDate] == NSOrderedSame){
        between = YES;
    }
    return between;
}
@end
