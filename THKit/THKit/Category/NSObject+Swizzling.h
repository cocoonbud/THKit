//
//  NSObject+Swizzling.h
//  THKit
//
//  Created by Terence Yang on 2021/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzlingedSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
