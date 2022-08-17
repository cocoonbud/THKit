//
//  NSObject+Swizzling.m
//  THKit
//
//  Created by Terence Yang on 2021/8/3.
//

#import "NSObject+Swizzling.h"
#import <objc/message.h>

@implementation NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzlingedSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL addM = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (addM) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
