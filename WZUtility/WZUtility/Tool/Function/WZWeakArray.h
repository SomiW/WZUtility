//
//  WZWeakArray.h
//  WZUtility
//
//  Created by wz on 2018/8/22.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZWeakArray : NSObject

@property (readonly) NSUInteger count;

- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)removeAllObjects;

- (void)clearNull;
@end
