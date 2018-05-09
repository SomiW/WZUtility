//
//  WZRefection.m
//  WZUtility
//
//  Created by wz on 2018/5/8.
//  Copyright © 2018年 @. All rights reserved.
//

#import "WZRefection.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation WZRefection

/**
 *  @brief: 根据类型，取得所有对象属性名称列表（含父类）
 *  @param objClass 定义的类
 *  @return: 返回属性名的数组，不包括NSObject的扩展属性
 */
+ (NSArray *)objectPropertiesWithClass:(Class)objClass {
    
    return [WZRefection objectPropertiesWithClass:objClass stopSuperClass:[NSObject class]];
    
}

/**
 *  @brief: 根据类型，取得所有对象属性名称列表（含父类）
 *  @param objClass 定义的类
 *  @param stopSuperClass 递归终止的父类
 *  @return: 返回属性名的数组，不包括NSObject的扩展属性
 */
+ (NSArray *)objectPropertiesWithClass:(Class)objClass stopSuperClass:(Class)stopSuperClass {
    
    NSMutableArray * propertyNames = [NSMutableArray array];
    while (objClass != stopSuperClass) {
        unsigned int propertyCount = 0;
        objc_property_t * properties = class_copyPropertyList(objClass, &propertyCount);
        for (unsigned int i = 0; i < propertyCount; ++i) {
            objc_property_t property = properties[i];
            const char * name = property_getName(property);
            [propertyNames addObject:[NSString stringWithUTF8String:name]];
        }
        free(properties);
        objClass = class_getSuperclass(objClass);
    }
    return propertyNames;
}

/**
 *  @brief: 根据类的属性名取属性对象
 *  @param objClass 类
 *  @param zPropertyName 属性名称(C字符串)
 *  @return: 返回一个 WZObjectProperty 对象实例
 */
+ (WZObjectProperty *)propertyWithClass:(Class)objClass zPropertyName:(const char *)zPropertyName {
    WZObjectProperty *objectProperty = [[WZObjectProperty alloc]init];
    while (objClass != [NSObject class]) {
        unsigned int propertyCount = 0;
        objc_property_t * properties = class_copyPropertyList(objClass, &propertyCount);
        for (unsigned int i = 0; i < propertyCount; ++i) {
            objc_property_t property = properties[i];
            const char * name = property_getName(property);
            if (strcmp(name, zPropertyName) == 0) {
                
                
                free(properties);
                break;
            }
        }
        free(properties);
        objClass = class_getSuperclass(objClass);
    };
    return objectProperty;
}

/**
 *  @brief: 根据属性名称集合返回属性对象集合
 *  @param objClass 类
 *  @param classNames 属性数组
 */
+ (NSArray *)objectPropertiesWithClass:(Class)objClass propertyNames:(NSArray *)propertyNames {
    return nil;
}

/**
 *  @brief: 通过WZObjectProperty数组，返回属性名称数组
 *  @param objectProperties:WZObjectProperty 对象数组
 *  @return: 返回属性
 */
+ (NSArray *)propertyNamesFromObjectProperties:(NSArray *)objectProperties {
    return @[];
}



/*
 @brief:通过类型和属性名，取得属性的类型字符串
 @param objClass:定义的类
 @param propertyName:属性名称C字符串
 @return:返回属性类型的C字符串,需要释放
 */
+ (const char *)copyPropertyTypeWithClass:(Class)objcClass propertyName:(const char *)propertyName{
    return 'C';
}


/*
 *  @brief:执行给定的类的类方法
 *  @param className:类的字符串定义
 *  @param method:类方法名称，即通过NSStringFromSelector得到的selector字符串
 *  @param parameters:类方法的参数数组，需要传入selector,可以为nil
 *  @return:如果有返回值那么返回相应的对象或者通过NSValue、NSNumber包装的类型
 */
+ (id)executeClassMethod:(NSString *)className
                  method:(NSString *)method
              parameters:(NSArray *)parameters{
    if (!className || !method) {
        return nil;
    }
    Class objClass = NSClassFromString(className);
    SEL sel = NSSelectorFromString(method);
    NSMethodSignature *sig = [objClass methodSignatureForSelector:sel];
    
    if (!sig) { [self doesNotRecognizeSelector:sel]; return nil; }
   __block NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
    if (!inv) { [self doesNotRecognizeSelector:sel]; return nil; }
    [inv setTarget:objClass];
    [inv setSelector:sel];
    if ([WZRefection setInv:inv withSig:sig andArgs:parameters]) {
        [inv invoke];
        return [WZRefection getReturnFromInv:inv withSig:sig];
    }else {
        NSLog(@"参数非法");
        return nil;
    }
    
//    Class objClass = objc_getClass(className);
//    if (!objClass) {
//        return nil;
//    }
//    SEL sel = sel_registerName(method);
//    Method ivar_Method = class_getClassMethod(objClass,sel);
//    if (!ivar_Method) {
//        return nil;
//    }
//
//    ((void(*)(id,Method))method_invoke)(object_getClass(objClass),ivar_Method);
//
//    //获取返回值类型
//    const char* method_ReturnType = method_copyReturnType(ivar_Method);
//    NSLog(@"method_ReturnType:%@",[NSString stringWithUTF8String:method_ReturnType]);
//
//    //获取参数类型
//    unsigned int number = method_getNumberOfArguments(ivar_Method);
//    for ( int i = 0; i < number ; i ++)
//    {
//        const char *type = method_copyArgumentType(ivar_Method, i);
//        NSLog(@"ArgumentType:%@",[NSString stringWithUTF8String:type]);
//    }
    
    
    return @[];
}


+ (id)getReturnFromInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig {
    NSUInteger length = [sig methodReturnLength];
    if (length == 0) return nil;
    
    char *type = (char *)[sig methodReturnType];
    while (*type == 'r' || // const
           *type == 'n' || // in
           *type == 'N' || // inout
           *type == 'o' || // out
           *type == 'O' || // bycopy
           *type == 'R' || // byref
           *type == 'V') { // oneway
        type++; // cutoff useless prefix
    }
    
#define return_with_number(_type_) \
do { \
_type_ ret; \
[inv getReturnValue:&ret]; \
return @(ret); \
} while (0)
    
    switch (*type) {
        case 'v': return nil; // void
        case 'B': return_with_number(bool);
        case 'c': return_with_number(char);
        case 'C': return_with_number(unsigned char);
        case 's': return_with_number(short);
        case 'S': return_with_number(unsigned short);
        case 'i': return_with_number(int);
        case 'I': return_with_number(unsigned int);
        case 'l': return_with_number(int);
        case 'L': return_with_number(unsigned int);
        case 'q': return_with_number(long long);
        case 'Q': return_with_number(unsigned long long);
        case 'f': return_with_number(float);
        case 'd': return_with_number(double);
        case 'D': { // long double
            long double ret;
            [inv getReturnValue:&ret];
            return [NSNumber numberWithDouble:ret];
        };
            
        case '@': { // id
            id ret = nil;
            [inv getReturnValue:&ret];
            return ret;
        };
            
        case '#': { // Class
            Class ret = nil;
            [inv getReturnValue:&ret];
            return ret;
        };
            
        default: { // struct / union / SEL / void* / unknown
            const char *objCType = [sig methodReturnType];
            char *buf = calloc(1, length);
            if (!buf) return nil;
            [inv getReturnValue:buf];
            NSValue *value = [NSValue valueWithBytes:buf objCType:objCType];
            free(buf);
            return value;
        };
    }
#undef return_with_number
}

+ (BOOL)setInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig andArgs:(NSArray *)args {
    NSUInteger count = [sig numberOfArguments];
    if (!args || args.count == 0) {
        if (count == 0) {
            return NO;
        }else
            return YES;
    }
    BOOL unsupportedType = NO;
    for (int index = 2; index < count; index++) {
        if (args.count < index - 2) {
            break;
        }
        id argObj = args[index - 2];
        char *type = (char *)[sig getArgumentTypeAtIndex:index];
        while (*type == 'r' || // const
               *type == 'n' || // in
               *type == 'N' || // inout
               *type == 'o' || // out
               *type == 'O' || // bycopy
               *type == 'R' || // byref
               *type == 'V') { // oneway
            type++; // cutoff useless prefix
        }
        
        switch (*type) {
            case 'v': // 1: void
            case 'B': // 1: bool
            case 'c': // 1: char / BOOL
            case 'C': // 1: unsigned char
            case 's': // 2: short
            case 'S': // 2: unsigned short
            case 'i': // 4: int / NSInteger(32bit)
            case 'I': // 4: unsigned int / NSUInteger(32bit)
            case 'l': // 4: long(32bit)
            case 'L': // 4: unsigned long(32bit)
            { // 'char' and 'short' will be promoted to 'int'.
                int arg = [argObj intValue];
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'q': // 8: long long / long(64bit) / NSInteger(64bit)
            case 'Q': // 8: unsigned long long / unsigned long(64bit) / NSUInteger(64bit)
            {
                long long arg = [argObj longLongValue];
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'f': // 4: float / CGFloat(32bit)
            { // 'float' will be promoted to 'double'.
                double arg = [argObj doubleValue];
                float argf = arg;
                [inv setArgument:&argf atIndex:index];
            } break;
                
            case 'd': // 8: double / CGFloat(64bit)
            {
                double arg = [argObj doubleValue];
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case 'D': // 16: long double
            {
                long double arg = [argObj doubleValue];
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '*': // char *
            case '^': // pointer
            {
                unsupportedType = YES;
            } break;
                
            case ':': // SEL
            {
                unsupportedType = YES;
            } break;
                
            case '#': // Class
            {
                unsupportedType = YES;
            } break;
                
            case '@': // id
            {
                id arg = argObj;
                [inv setArgument:&arg atIndex:index];
            } break;
                
            case '{': // struct
            {
                if (strcmp(type, @encode(CGPoint)) == 0) {
                    CGPoint arg = [argObj CGPointValue];
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGSize)) == 0) {
                    CGSize arg = [argObj CGSizeValue];
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGRect)) == 0) {
                    CGRect arg = [argObj CGRectValue];
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGVector)) == 0) {
                    CGVector arg = [argObj CGVectorValue];;
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
                    CGAffineTransform arg = [argObj CGAffineTransformValue];;
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(CATransform3D)) == 0) {
                    CATransform3D arg = [argObj CATransform3DValue];;
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(NSRange)) == 0) {
                    NSRange arg = [argObj rangeValue];;
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(UIOffset)) == 0) {
                    UIOffset arg = [argObj UIOffsetValue];;
                    [inv setArgument:&arg atIndex:index];
                } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
                    UIEdgeInsets arg = [argObj UIEdgeInsetsValue];;
                    [inv setArgument:&arg atIndex:index];
                } else {
                    unsupportedType = YES;
                }
            } break;
                
            case '(': // union
            {
                unsupportedType = YES;
            } break;
                
            case '[': // array
            {
                unsupportedType = YES;
            } break;
                
            default: // what?!
            {
                unsupportedType = YES;
            } break;
        }
        
        if (unsupportedType)  {
            NSLog(@"------ unsupportedType -------");
            break;
        }
    }
    
    if (unsupportedType) {
        return NO;
    }else
        return YES;
    
}

@end
