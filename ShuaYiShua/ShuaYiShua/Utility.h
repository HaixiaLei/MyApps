//
//  Utility.h
//  ShowMessage
//
//  Created by Sywine on 8/18/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

/**
 *  返回放在工程中png图片
 */
+(UIImage *)imagePngInBundleWithName:(NSString *)name;

/**
 *  获取documents路径
 */
+ (NSString *)documentsDirectory;

/**
 *  获取以fileName为名的路径
 */
+ (NSString *)getFilePathWithName:(NSString *)fileName;

/**
 *  删除文件／文件夹
 */
+ (BOOL)deleteFile:(NSString*)path;


@end
