//
//  SingleObject.m
//  ShuaYiShua
//
//  Created by Sywine on 8/25/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import "SingleObject.h"
#import "Utility.h"
#import "MacroDefinitions.h"

#define LOG_FILE_NAME @"logFile.txt"

@implementation SingleObject

+ (SingleObject *)shared{
    static SingleObject *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SingleObject alloc] init];
    });
    return _sharedClient;
}

- (BOOL)logUserAction:(NSString *)action{
    LOG(action);
    if (!action || !action.length) return NO;
    NSString *filePath = [Utility getFilePathWithName:LOG_FILE_NAME];
    if (filePath) {
        NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        if (!string)  string = @"";
        string = [string stringByAppendingFormat:@"%@\n",action];
        return [string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return NO;
}

- (NSString *)userActions{
    NSString *filePath = [Utility getFilePathWithName:LOG_FILE_NAME];
    NSString *action = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    action = [NSString stringWithFormat:@"\n\n\n******************************************************\n******************** User Actions ********************\n******************************************************\n%@\n******************************************************\n******************** User Actions ********************\n******************************************************\n\n\n\n",action];
    return action;
}
- (BOOL)emptyUserActions{
    NSString *filePath = [Utility getFilePathWithName:LOG_FILE_NAME];
    return [@"" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
