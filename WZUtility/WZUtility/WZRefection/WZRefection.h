//
//  WZRefection.h
//  WZUtility
//
//  Created by wz on 2018/5/8.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  简单反射方法集合
 */
@interface WZRefection : NSObject

/**
 *  @brief: 根据类型，取得所有对象属性名称列表（含父类）
 *  @param objClass 定义的类
 *  @return: 返回属性名的数组，不包括NSObject的扩展属性
 */
+ (NSArray *)objectPropertiesWithClass:(Class)objClass;

/**
 *  @brief: 根据类型，取得所有对象属性名称列表（含父类）
 *  @param objClass 定义的类
 *  @param stopSuperClass 递归终止的父类
 *  @return: 返回属性名的数组，不包括NSObject的扩展属性
 */
+ (NSArray *)objectPropertiesWithClass:(Class)objClass stopSuperClass:(Class)stopSuperClass;


/*
 *  @brief:执行给定的类的类方法
 *  @param className:类的字符串定义
 *  @param method:类方法名称，即通过NSStringFromSelector得到的selector字符串
 *  @param parameters:类方法的参数数组，需要传入selector,可以为nil
 *  @return:如果有返回值那么返回相应的对象或者通过NSValue、NSNumber包装的类型
 */
+ (id)executeClassMethod:(NSString *)className
                  method:(NSString *)method
              parameters:(NSArray *)parameters;


@end
