//
//  NSTimer+Additional.h
//  ShuaYiShua
//
//  Created by Sywine on 9/4/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Additional)

+ (CFRunLoopTimerRef)schedule:(NSTimeInterval)delay handler:(void (^)(CFRunLoopTimerRef))handler;

@end
