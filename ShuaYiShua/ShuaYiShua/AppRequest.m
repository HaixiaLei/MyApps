//
//  AppRequest.m
//  ShuaYiShua
//
//  Created by Sywine on 8/26/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "AppRequest.h"

@implementation AppRequest

-(void)setMethod:(APIMethod)method{
    self.method = method;
    
}

-(APIMethod)method{
    return self.method;
}

@end
