//
//  NSDate+WZAdd.m
//  WZUtility
//
//  Created by wz on 2018/5/15.
//  Copyright © 2018年 @. All rights reserved.
//

#import "NSDate+WZAdd.h"

@implementation NSDate (WZAdd)

//时间戳
- (NSString *)timestamp {
    NSInteger timeSp = [[NSNumber numberWithDouble:[self timeIntervalSince1970] * 1000] integerValue];
    return [NSString stringWithFormat:@"%ld",timeSp];
}

@end
