//
//  Person.m
//  WZUtility
//
//  Created by wz on 2018/5/8.
//  Copyright © 2018年 @. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)eat {
    NSLog(@"eat");
}

+ (CGFloat)sleepHour:(CGFloat)hours name:(NSString *)name {
    NSLog(@"hours: %f,%@",hours,name);
    return hours;
}

@end


@implementation Parent

@end


@implementation Child

@end
