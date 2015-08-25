//
//  NSString+Additional.m
//  ShowMessage
//
//  Created by Heguiting on 8/17/15.
//  Copyright (c) 2015 Heguiting. All rights reserved.
//

#import "NSString+Additional.h"

@implementation NSString (Additional)

-(NSDictionary *) dictionaryValue{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"Fail to get dictioanry from String: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}

-(NSArray *) arrayValue{
    NSError *errorJson;
    NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"Fail to get array from String: %@, error: %@", self, errorJson);
#endif
    }
    return jsonArr;
}

- (BOOL)containString:(NSString *)target {
    if (target == nil) {
        return NO;
    }
    NSRange range = [self rangeOfString:target];
    if (range.length > 0) {
        return YES;
    }
    
    return NO;
}

-(CGSize)getContentSizeWithFont:(UIFont *)font andWidth:(CGFloat)w andHeight:(CGFloat)h
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        return [self boundingRectWithSize:CGSizeMake(w, h) options:NSStringDrawingTruncatesLastVisibleLine attributes:nil context:nil].size;
    }else{
        return  [self sizeWithFont:font constrainedToSize:CGSizeMake(w, h) lineBreakMode:NSLineBreakByWordWrapping];
        
    }
}

@end
