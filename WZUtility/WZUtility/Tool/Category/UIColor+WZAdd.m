//
//  UIColor+WZAdd.m
//  WZUtility
//
//  Created by wz on 2018/5/23.
//  Copyright © 2018年 @. All rights reserved.
//

#import "UIColor+WZAdd.h"

@implementation UIColor (WZAdd)

+ (UIColor *)randomColor {
    
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
    
}
@end
