//
//  SingleObject.h
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleObject : NSObject

+ (SingleObject *)shared;

@property (nonatomic, assign) BOOL isIntroduceForcedToShow;

@end
