//
//  SingleObject.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "SingleObject.h"

@implementation SingleObject

+ (SingleObject *)shared{
    static SingleObject *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SingleObject alloc] init];
    });
    return _sharedClient;
}

@end
