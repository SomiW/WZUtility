//
//  NSString+WZAdd.m
//  WZUtility
//
//  Created by wz on 2018/5/21.
//  Copyright © 2018年 @. All rights reserved.
//

#import "NSString+WZAdd.h"

@implementation NSString (WZAdd)

+ (nonnull NSString *)ifNullString:(nullable NSString *)string defaultString:(nonnull NSString *)defaultString {
    if ([[self class] isValidString:string]) {
        return string;
    }else
        return defaultString;
}

+ (nonnull NSString *)ifNullString:(nullable NSString *)string {
    if ([[self class] isValidString:string]) {
        return string;
    }else
        return @"";
}

+ (BOOL)isValidString:(nullable NSString *)string {
    
    if (string == nil) {
        return NO;
    }
    
    if (string == NULL) {
        return NO;
    }
    
    if ([string isKindOfClass:[NSNull class]] || ![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    return YES;
}

+ (NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSString *randomString = [[self class] randomStringWithLength:len String:letters];
    return randomString;
}

+ (NSString *)randomStringWithLength:(NSInteger)len String:(NSString *)letters {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length])]];
    }
    return randomString;
}

@end
