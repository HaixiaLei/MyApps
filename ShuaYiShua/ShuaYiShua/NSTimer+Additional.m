//
//  NSTimer+Additional.m
//  ShuaYiShua
//
//  Created by Sywine on 9/4/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "NSTimer+Additional.h"

@implementation NSTimer (Additional)

+ (CFRunLoopTimerRef)schedule:(NSTimeInterval)delay handler:(void (^)(CFRunLoopTimerRef))handler {
    NSTimeInterval fireDate = CFAbsoluteTimeGetCurrent() + delay;
    CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    return timer;
}

@end
