//
//  NSObject+PrintPrettyLog.m
//  THKit
//
//  Created by Terence Yang on 2020/5/11.
//

#ifdef DEBUG
#import "NSObject+PrintPrettyLog.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (PrintPrettyLog)

- (NSString *)trans2JsonStr {
    if (![NSJSONSerialization isValidJSONObject:self]) return nil;
    
    NSJSONWritingOptions jsonOp = NSJSONWritingPrettyPrinted;
    
    if (@available(iOS 11.0, *)) jsonOp = NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys;
    
    NSError *error = nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:jsonOp error:&error];
    
    if (error || !data) return nil;
    
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}

@end



#pragma mark - NSArray
@implementation NSArray (PrintPrettyLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(descriptionWithLocale:)
                            bySwizzlingedSelector:@selector(p_descriptionWithLocale:)];
        [self methodSwizzlingWithOriginalSelector:@selector(debugDescription)
                            bySwizzlingedSelector:@selector(p_debugDescription)];
        [self methodSwizzlingWithOriginalSelector:@selector(descriptionWithLocale:indent:)
                            bySwizzlingedSelector:@selector(p_descriptionWithLocale:indent:)];
    });
}

- (NSString *)p_descriptionWithLocale:(id)locale{
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        result = [self p_descriptionWithLocale:locale];
        return result;
    }
    return result;
}

- (NSString *)p_debugDescription{
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        return [self p_debugDescription];
    }
    return result;
}

- (NSString *)p_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        result = [self p_descriptionWithLocale:locale indent:level];
        return result;
    }
    return result;
}

@end




#pragma mark - NSDictionary
@implementation NSDictionary (PrintPrettyLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(descriptionWithLocale:)
                            bySwizzlingedSelector:@selector(p_descriptionWithLocale:)];
        [self methodSwizzlingWithOriginalSelector:@selector(debugDescription)
                            bySwizzlingedSelector:@selector(p_debugDescription)];
        [self methodSwizzlingWithOriginalSelector:@selector(descriptionWithLocale:indent:)
                            bySwizzlingedSelector:@selector(p_descriptionWithLocale:indent:)];
    });
}

- (NSString *)p_descriptionWithLocale:(id)locale{
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        result = [self p_descriptionWithLocale:locale];
        return result;
    }
    return result;
}

- (NSString *)p_debugDescription{
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        return [self p_debugDescription];
    }
    return result;
}

- (NSString *)p_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *result = [self trans2JsonStr];
    
    if (result.length < 1) {
        result = [self p_descriptionWithLocale:locale indent:level];
        return result;
    }
    return result;
}

@end
#endif
