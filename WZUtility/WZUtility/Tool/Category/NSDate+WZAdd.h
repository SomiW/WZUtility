//
//  NSDate+WZAdd.h
//  WZUtility
//
//  Created by wz on 2018/5/15.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WZAdd)

//时间戳
- (NSString *)timestamp;

- (nullable NSDate *)dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;

- (NSDate *)systemTimeZoneDate;
- (NSDate *)dateForTimeZone:(NSTimeZone *)timeZone;

@end
