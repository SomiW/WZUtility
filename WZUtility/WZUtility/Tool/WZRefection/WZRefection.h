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


/**
 *  @brief:执行给定对象的实例方法
 *  @param object:实例对象
 *  @param method:方法名称，即通过NSStringFromSelector得到的selector字符串
 *  @param parameters:方法的参数数组，需要传入selector,可以为nil
 *  @return:如果有返回值那么返回相应的对象或者通过NSValue、NSNumber包装的类型
 */
+ (id)executeInstanceMethod:(NSObject *)object
                     method:(NSString *)method
                 parameters:(NSArray *)parameters;

/*
 *  @brief:给定的类型，通过初始化序列方法进行初始化
 *  @param className:类的字符串定义
 *  @param initMethod:初始化方法名称，即通过NSStringFromSelector得到的selector字符串
 *  @param initParameters:初始化方法的参数数组，需要传入selector,可以为nil
 *  @param isClass:是否是这个类型，如果不是这个类型，那么返回nil
 *  @return:返回className制定的对象实例
 */
+ (id)objectWithClassName:(NSString *)className
               initMethod:(NSString *)initMethod
           initParameters:(NSArray *)initParameters
                 subClass:(Class)subClass;

@end
