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
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isLastLaunchCrashed;

/**
 *  记录和返回用户行为
 */
- (BOOL)logUserAction:(NSString *)action;
- (NSString *)userActions;
- (BOOL)emptyUserActions;

@end
