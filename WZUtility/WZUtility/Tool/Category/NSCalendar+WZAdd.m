//
//  NSCalendar+WZAdd.m
//  WZUtility
//
//  Created by wz on 2018/5/23.
//  Copyright © 2018年 @. All rights reserved.
//

#import "NSCalendar+WZAdd.h"
#import <objc/runtime.h>

@implementation NSCalendar (WZAdd)

- (nullable NSDate *)firstDayOfMonth:(NSDate *)month {
    if (!month) return nil;
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:month];
    components.day = 1;
    return [self dateFromComponents:components];
}
- (nullable NSDate *)lastDayOfMonth:(NSDate *)month {
    if (!month) return nil;
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:month];
    components.month++;
    components.day = 0;
    return [self dateFromComponents:components];
}

- (nullable NSDate *)firstDayOfWeek:(NSDate *)week {
    if (!week) return nil;
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents *components = self.privateComponents;
    components.day = - (weekdayComponents.weekday - self.firstWeekday);
    components.day = (components.day-7) % 7;
    NSDate *firstDayOfWeek = [self dateByAddingComponents:components toDate:week options:0];
    firstDayOfWeek = [self dateBySettingHour:0 minute:0 second:0 ofDate:firstDayOfWeek options:0];
    components.day = NSIntegerMax;
    return firstDayOfWeek;
}
- (nullable NSDate *)lastDayOfWeek:(NSDate *)week {
    if (!week) return nil;
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents *components = self.privateComponents;
    components.day = - (weekdayComponents.weekday - self.firstWeekday);
    components.day = (components.day-7) % 7 + 6;
    NSDate *lastDayOfWeek = [self dateByAddingComponents:components toDate:week options:0];
    lastDayOfWeek = [self dateBySettingHour:0 minute:0 second:0 ofDate:lastDayOfWeek options:0];
    components.day = NSIntegerMax;
    return lastDayOfWeek;
}
- (nullable NSDate *)middleDayOfWeek:(NSDate *)week {
    if (!week) return nil;
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents *componentsToSubtract = self.privateComponents;
    componentsToSubtract.day = - (weekdayComponents.weekday - self.firstWeekday) + 3;
    NSDate *middleDayOfWeek = [self dateByAddingComponents:componentsToSubtract toDate:week options:0];
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:middleDayOfWeek];
    middleDayOfWeek = [self dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return middleDayOfWeek;
}
- (NSInteger)numberOfDaysInMonth:(NSDate *)month {
    if (!month) return 0;
    NSRange days = [self rangeOfUnit:NSCalendarUnitDay
                              inUnit:NSCalendarUnitMonth
                             forDate:month];
    return days.length;
}

- (NSDateComponents *)privateComponents
{
    NSDateComponents *components = objc_getAssociatedObject(self, _cmd);
    if (!components) {
        components = [[NSDateComponents alloc] init];
        objc_setAssociatedObject(self, _cmd, components, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return components;
}

@end
