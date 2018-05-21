//
//  WZUIHelper.m
//  WZUtility
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 @. All rights reserved.
//

#import "WZUIHelper.h"

@implementation UIView (initHelper)

+ (instancetype)viewWithBackgroundColor:(UIColor *)bgColor {
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor = bgColor;
    return view;
}

@end

@implementation UILabel (initHelper)

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[self alloc]initWithFrame:CGRectZero];
    label.font = font;
    label.textColor = textColor;
    return label;
}

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[self alloc]initWithFrame:CGRectZero];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    label.numberOfLines = 1;
    return label;
}
@end

@implementation UIButton (initHelper)

+ (instancetype)buttonWithType:(UIButtonType)buttonType normalTitle:(NSString *)title normalImage:(UIImage *)image normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont {
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    return button;
}

+ (instancetype)buttonWithNormalTitle:(NSString *)title normalImage:(UIImage *)image normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    return button;
}

+ (instancetype)buttonWithNormalTitle:(NSString *)title normalTitleColor:(UIColor *)textColor normalTitleFont:(UIFont *)titleFont {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    return button;
}

+ (instancetype)buttonWithNormalImage:(UIImage *)image {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    return button;
}

@end
