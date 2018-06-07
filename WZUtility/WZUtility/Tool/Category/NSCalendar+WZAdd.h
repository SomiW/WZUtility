//
//  NSCalendar+WZAdd.h
//  WZUtility
//
//  Created by wz on 2018/5/23.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (WZAdd)

- (nullable NSDate *)firstDayOfMonth:(NSDate *)month;
- (nullable NSDate *)lastDayOfMonth:(NSDate *)month;
- (nullable NSDate *)firstDayOfWeek:(NSDate *)week;
- (nullable NSDate *)lastDayOfWeek:(NSDate *)week;
- (nullable NSDate *)middleDayOfWeek:(NSDate *)week;
- (NSInteger)numberOfDaysInMonth:(NSDate *)month;

@end
