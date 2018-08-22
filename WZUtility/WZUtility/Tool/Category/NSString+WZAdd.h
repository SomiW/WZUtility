//
//  NSString+WZAdd.h
//  WZUtility
//
//  Created by wz on 2018/5/21.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WZAdd)

/**
 *  @brief: 返回一个非空字符串
 *  @param string 需要判断的字符串
 *  @param defaultString 如果string为空，返回的字符串
 *  @param return 返回一个字符串
 */
+ (nonnull NSString *)ifNullString:(nullable NSString *)string defaultString:(nonnull NSString *)defaultString;

/**
 *  @brief: 以空串作为缺省字符串返回一个非空字符串
 *  @param string 需要判断的字符串
 *  @param return 返回一个字符串
 */
+ (nonnull NSString *)ifNullString:(nullable NSString *)string;

/**
 *  @brief: 判断是否有效字符串
 */
+ (BOOL)isValidString:(nullable NSString *)string;

/**
 *  @brief: 生成指定长度的随机字符串
 *  @param len 需要字符串的长度
 *  @param return 返回一个随机字符串
 */
+ (NSString *)randomStringWithLength:(NSInteger)len;

/**
 *  @brief: 在给定的字符里生成指定长度的随机字符串
 *  @param len 需要字符串的长度
 *  @param letters 给定的字符数组
 *  @param return 返回一个随机字符串
 */
+ (NSString *)randomStringWithLength:(NSInteger)len String:(NSString *)letters;


/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;

@end
