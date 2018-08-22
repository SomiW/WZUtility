//
//  WZDeviceUtility.m
//  WZUtility
//
//  Created by wz on 2018/5/23.
//  Copyright © 2018年 @. All rights reserved.
//

#import "WZDeviceUtility.h"
#import "sys/utsname.h"

@implementation WZDeviceUtility


/**
 *  @brief:app版本
 */
+ (nonnull NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return value;
}

/**
 *  @brief:app名字
 */
+ (nonnull NSString *)getAppName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return value;
}

/**
 *  @brief:app构建版本
 */
+ (nonnull NSString *)getAppBuildInfo {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"CFBundleInfoDictionaryVersion"];
    return value;
}

/**
 *  @brief:app版本target的名字
 */
+ (nonnull NSString *)getExecuteName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"CFBundleExecutable"];
    return value;
}

/**
 *  @brief:appbundle的信息
 */
+ (nonnull NSString *)getBundleId {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return value;
}

/**
 *  @brief:设备相关,取设备os信息，return sample: iOS7.1
 */
+ (nonnull NSString *)getDeviceOS {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *value = [infoDictionary objectForKey:@"DTSDKName"];
    return value;
}

/**
 *  @brief:设备相关,取设备信息，return sample :iPhone5,1
 */

+ (NSString *)getDeviceModel {
    
    // 需要#import "sys/utsname.h"
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    return deviceString;
    
}

/**
 *  @brief:系统版本
 */
+ (CGFloat)systemVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CGFloat value = [[infoDictionary objectForKey:@"DTPlatformVersion"] floatValue];
    return value;
}

/**
 *  @brief:设备相关,取设备的uuid
 */
+ (nonnull NSString *)getUUID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:[[self class] getBundleId]];
}

/**
 *  @brief: 移除标识符
 */
+ (void)removeUUID {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[[self class] getBundleId]];
}

/**
 *  @brief : 创建一个唯一标识字符串
 */
+ (nonnull NSString *)createUUID {
    NSString *uuid = [[self class] getUUID];
    if (uuid && ![uuid isEqualToString:@""]) {
        return uuid;
    }
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    uuid = [NSString stringWithFormat:@"%@", uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    [[NSUserDefaults standardUserDefaults] setValue:uuid forKey:[[self class] getBundleId]];
    return [uuid lowercaseString];
}

/**
 *  @brief:返回状态栏的高度
 *  @param orientation 方向
 *  @return:返回高度
 */
+ (CGFloat)statusBarHeightWithOrientation:(UIInterfaceOrientation)orientation {
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectStatus.size.height;
}

/**
 *  @brief: 是否为3.5寸屏
 */
+ (BOOL)is3_5_inch {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ((screenWidth == 320 && screenHeight == 480) || (screenWidth == 480 && screenHeight == 320)) {
        return YES;
    }else
        return NO;
}

/**
 *  @brief: 是否为4寸屏
 */
+ (BOOL)is4_0_inch {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ((screenWidth == 320 && screenHeight == 568) || (screenWidth == 568 && screenHeight == 320)) {
        return YES;
    }else
        return NO;
}

/**
 *  @brief: 是否为4.7寸屏
 */
+ (BOOL)is4_7_inch {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ((screenWidth == 375 && screenHeight == 667) || (screenWidth == 667 && screenHeight == 375)) {
        return YES;
    }else
        return NO;
}

/**
 *  @brief: 是否为5.5寸屏
 */
+ (BOOL)is5_5_inch {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ((screenWidth == 414 && screenHeight == 736) || (screenWidth == 736 && screenHeight == 414)) {
        return YES;
    }else
        return NO;
}

/**
 *  @brief : 是否为5.8寸屏
 */
+ (BOOL)is5_8_inch {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if ((screenWidth == 375 && screenHeight == 812) || (screenWidth == 812 && screenHeight == 375)) {
        return YES;
    }else
        return NO;
}

/**
 *  @brief : iPhoneX safe top offset
 */
+ (CGFloat)topOffsetFor_5_8_inch {
    if ([[self class] is5_8_inch]) {
        CGFloat statusBarHeight = [[self class] statusBarHeightWithOrientation:UIInterfaceOrientationPortrait];
        if (statusBarHeight == 0) {
            return 24;
        }else
            return 0;
    }else
        return 0;
}

/**
 *  @brief : iPhoneX safe bottom offset
 */
+ (CGFloat)bottomOffsetFor_5_8_inch {
    return 34;
}

/**
 *  @brief : bottom offset
 */
+ (CGFloat)bottomOffset {
    if ([[self class] is5_8_inch]) {
        return [[self class] bottomOffsetFor_5_8_inch];
    }else
        return 0;
}
/**
 *  @brief : 是否设置代理
 */
- (BOOL)getProxyStatus {
    NSDictionary *proxySettings =  (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
    NSArray *proxies = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)([NSURL URLWithString:@"http://www.baidu.com"]), (__bridge CFDictionaryRef _Nonnull)(proxySettings)));
    NSDictionary *settings = [proxies objectAtIndex:0];
    
    NSLog(@"host=%@", [settings objectForKey:(NSString *)kCFProxyHostNameKey]);
    NSLog(@"port=%@", [settings objectForKey:(NSString *)kCFProxyPortNumberKey]);
    NSLog(@"type=%@", [settings objectForKey:(NSString *)kCFProxyTypeKey]);
    
    if ([[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"]){
        //没有设置代理
        return NO;
    }else{
        //设置代理了
        return YES;
    }
}

@end
