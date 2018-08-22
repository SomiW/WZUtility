//
//  WZWeakArray.m
//  WZUtility
//
//  Created by wz on 2018/8/22.
//  Copyright © 2018年 @. All rights reserved.
//

#import "WZWeakArray.h"
#import <Foundation/NSObject.h>

@interface WZWeakArray ()

@property (nonatomic, strong) NSPointerArray *weakArray;

@end

@implementation WZWeakArray


- (NSUInteger)count {
    return _weakArray.count;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _weakArray = [NSPointerArray weakObjectsPointerArray];
}

- (void)addObject:(id)anObject {
    [_weakArray addPointer:(__bridge void * _Nullable)(anObject)];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [_weakArray insertPointer:(__bridge void * _Nullable)(anObject) atIndex:index];
}

- (void)removeLastObject {
    [self removeObjectAtIndex:(_weakArray.count - 1)];
    
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    if (_weakArray.count && index < _weakArray.count) {
        [_weakArray removePointerAtIndex:index];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (_weakArray.count && index < _weakArray.count) {
        [_weakArray replacePointerAtIndex:index withPointer:(__bridge void * _Nullable)(anObject)];
    }
}

- (void)removeAllObjects {
    for (NSInteger index = 0; index < _weakArray.count; index ++) {
        [_weakArray removePointerAtIndex:index];
    }
}

- (void)clearNull {
    [_weakArray addPointer:NULL];
    [_weakArray compact];
}

@end
