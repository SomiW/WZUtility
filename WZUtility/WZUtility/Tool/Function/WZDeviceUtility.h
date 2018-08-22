//
//  WZDeviceUtility.h
//  WZUtility
//
//  Created by wz on 2018/5/23.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIKit.h>

@interface WZDeviceUtility : NSObject

/**
 *  @brief:app版本
 */
+ (nonnull NSString *)getAppVersion;

/**
 *  @brief:app名字
 */
+ (nonnull NSString *)getAppName;

/**
 *  @brief:app构建版本
 */
+ (nonnull NSString *)getAppBuildInfo;

/**
 *  @brief:app版本target的名字
 */
+ (nonnull NSString *)getExecuteName;

/**
 *  @brief:appbundle的信息
 */
+ (nonnull NSString *)getBundleId;

/**
 *  @brief:设备相关,取设备os信息，return sample: iOS7.1
 */
+ (nonnull NSString *)getDeviceOS;

/**
 *  @brief:设备相关,取设备信息，return sample :iPhone5,1
 */
+ (nonnull NSString *)getDeviceModel;

/**
 *  @brief:系统版本
 */
+ (CGFloat)systemVersion;

/**
 *  @brief:设备相关,取设备的uuid
 */
+ (nonnull NSString *)getUUID;

/**
 *  @brief: 移除标识符
 */
+ (void)removeUUID;

/**
 *  @brief : 创建一个唯一标识字符串
 */
+ (nonnull NSString *)createUUID;

/**
 *  @brief:返回状态栏的高度
 *  @param orientation 方向
 *  @return:返回高度
 */
+ (CGFloat)statusBarHeightWithOrientation:(UIInterfaceOrientation)orientation;

/**
 *  @brief: 是否为3.5寸屏
 */
+ (BOOL)is3_5_inch;

/**
 *  @brief: 是否为4寸屏
 */
+ (BOOL)is4_0_inch;

/**
 *  @brief: 是否为4.7寸屏
 */
+ (BOOL)is4_7_inch;

/**
 *  @brief: 是否为5.5寸屏
 */
+ (BOOL)is5_5_inch;

/**
 *  @brief : 是否为5.8寸屏
 */
+ (BOOL)is5_8_inch;

/**
 *  @brief : iPhoneX safe top offset
 */
+ (CGFloat)topOffsetFor_5_8_inch;

/**
 *  @brief : iPhoneX safe bottom offset
 */
//+ (CGFloat)bottomOffsetFor_5_8_inch;

/**
 *  @brief : bottom offset
 */
+ (CGFloat)bottomOffset;

@end
