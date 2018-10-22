//
//  NSObject+WZAdd.h
//  WZUtility
//
//  Created by wz on 2018/9/12.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WZAdd)

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

@end
