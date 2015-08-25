//
//  NSArray+Additional.m
//  ShowMessage
//
//  Created by Heguiting on 8/17/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import "NSArray+Additional.h"

@implementation NSArray (Additional)

- (NSString *)JSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"Fail to get JSON from array: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (id)safeObjectAtIndex:(NSUInteger)index{
    if (index > self.count) {
        return nil;
    }else{
        return [self objectAtIndex:index];
    }
}

@end
