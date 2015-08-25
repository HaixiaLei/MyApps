//
//  MacroDefinitions.h
//  ShowMessage
//
//  Created by Sywine on 8/21/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MacroDefinitions : NSObject

/**
 *  系统相关宏定义
 */
#ifndef
#define SYSTEM_VERSION ［UIDevice currentDevice] systemVersion] //系统版本
#define SYSTEM_MODEL ［UIDevice currentDevice] model];//是iphone 还是 ipad
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"] //app版本
#define APP_BUILD  [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"] //app buil
#endif



@end
