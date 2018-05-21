//
//  WZUIHelper.h
//  WZUtility
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (initHelper)

+ (instancetype)viewWithBackgroundColor:(UIColor *)bgColor;

@end

@interface UILabel (initHelper)


+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end

@interface UIButton (initHelper)

+ (instancetype)buttonWithType:(UIButtonType)buttonType normalTitle:(NSString *)title normalImage:(UIImage *)image normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont;

+ (instancetype)buttonWithNormalTitle:(NSString *)title normalImage:(UIImage *)image normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont;;

+ (instancetype)buttonWithNormalTitle:(NSString *)title normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont;

+ (instancetype)buttonWithNormalImage:(UIImage *)image;

@end

