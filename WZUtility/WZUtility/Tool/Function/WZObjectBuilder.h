//
//  WZObjectBuilder.h
//  WZUtility
//
//  Created by wz on 2018/5/16.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZObjectBuilder : NSObject


/**
 *  @brief: 通过模型类以及字典数组返回对象实例列表
 *  @param objCls: 对象类
 *  @param array: 字典数组
 *  @return: 返回一个实例对象列表
 */
+ (NSArray *)objectsWithClass:(Class)objCls
                                              array:(NSArray<NSDictionary *> *)array;


/**
 *  @brief: 通过模型类以及字典数组返回对象实例列表
 *  @param objCls: 对象类
 *  @param array: 字典数组
 *  @return: 返回一个实例对象列表
 */
+ (NSArray *)objectsWithClassName:(NSString *)objClsName
                                                  array:(NSArray<NSDictionary *> *)array;



@end
