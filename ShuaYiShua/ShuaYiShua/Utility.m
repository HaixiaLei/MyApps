//
//  Utility.m
//  ShowMessage
//
//  Created by Sywine on 8/18/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(UIImage *)imagePngInBundleWithName:(NSString *)name{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    return  [[UIImage alloc]initWithContentsOfFile:imagePath];
}
+ (NSString *)documentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)getFilePathWithName:(NSString *)fileName{
    NSString *documentsDirectory = [self documentsDirectory];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}
+ (BOOL)deleteFile:(NSString*)path {
    NSError *err;
    return [[NSFileManager defaultManager] removeItemAtPath:path error:&err];
}


@end
