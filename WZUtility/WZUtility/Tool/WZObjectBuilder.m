//
//  WZObjectBuilder.m
//  WZUtility
//
//  Created by wz on 2018/5/16.
//  Copyright © 2018年 @. All rights reserved.
//

#import "WZObjectBuilder.h"
#import "WZRefection.h"

@implementation WZObjectBuilder

/**
 *  @brief: 通过模型类以及字典数组返回对象实例列表
 *  @param objCls: 对象类
 *  @param array: 字典数组
 *  @return: 返回一个实例对象列表
 */
+ (NSArray *)objectsWithClass:(Class)objCls
                                         array:(NSArray<NSDictionary *> *)array {
    if (objCls && array && array.count) {
        
        return [[self class] objectsWithClassName:NSStringFromClass(objCls) array:array];;
    }else
        return nil;
}


/**
 *  @brief: 通过模型类以及字典数组返回对象实例列表
 *  @param objCls: 对象类
 *  @param array: 字典数组
 *  @return: 返回一个实例对象列表
 */
+ (NSArray *)objectsWithClassName:(NSString *)objClsName
                                             array:(NSArray<NSDictionary *> *)array {
    if (objClsName &&objClsName.length) {
        
        NSMutableArray *objs = [[NSMutableArray alloc]init];
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id objcc = [WZRefection objectWithClassName:objClsName initMethod:@"init" initParameters:nil subClass:[NSObject class]];
//            [objcc modelSetWithJSON:array[idx]];
            [objs addObject:objcc];
        }];
        return objs;
    }else
        return nil;
}
@end
