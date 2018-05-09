//
//  Person.h
//  WZUtility
//
//  Created by wz on 2018/5/8.
//  Copyright © 2018年 @. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

+ (void)eat;

+ (CGFloat)sleepHour:(CGFloat)hours name:(NSString *)name;


@end

typedef NS_ENUM(NSInteger, ParentType)  {
    ParentTypeMale,
    ParentTypeFemale
};

@class Child;

@interface Parent : Person

@property (nonatomic, assign) ParentType type;
@property (nonatomic, assign) BOOL hasChild;
@property (nonatomic, strong) NSArray <Child *>*childrens;

+ (Child *)giveBirthToChild:(CGSize)size;

+ (CGFloat)giveHeight:(CGFloat)height;

@end

@interface Child : Person

@property (nonatomic, copy) NSString *shcoolName;
@property (nonatomic) CGSize size;

@end
