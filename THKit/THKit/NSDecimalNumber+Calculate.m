//
//  NSDecimalNumber+Calculate.m
//  THKit
//
//  Created by Terence Yang on 2021/8/4.
//

#import "NSDecimalNumber+Calculate.h"

@implementation NSDecimalNumber (Calculate)

+ (NSDecimalNumber *)decimalNumber:(id)strOrNum roundingMode:(NSRoundingMode)mode scale:(int)scale {
    if (!strOrNum) return nil;
    NSDecimalNumber *one;

    
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    return  [one decimalNumberByRoundingAccordingToBehavior:handler];
}

+ (NSDecimalNumber *)decimalNumber:(id)obj1 with:(id)obj2 type:(THCalType)type completeHandler:(NSDecimalNumberHandler *)handler {
    if (!obj2 || !obj1) return nil;
    NSDecimalNumber *one = [NSDecimalNumber creatDecimalNumWith:obj1];
    
    NSDecimalNumber *another = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    NSDecimalNumber *returnNum;
    
    if (type == THCalAdd) {
        returnNum = [one decimalNumberByAdding:another];
    }else if (type == THCalSubtract){
        returnNum  = [one decimalNumberBySubtracting:another];
    }else if (type == THCalMultiply){
        returnNum = [one decimalNumberByMultiplyingBy:another];
    }else if (type == THCalDivide){
        if ([NSDecimalNumber compare:another with:@(0)] == 0) {
            returnNum = nil;
        }else {
            returnNum = [one decimalNumberByDividingBy:another];
        }
    }else{
        returnNum = nil;
    }
    if (returnNum) {
        if (handler) {
            return [returnNum decimalNumberByRoundingAccordingToBehavior:handler];
        }else{
            return returnNum;
        }
    }else{
        return nil;
    }
}

+ (NSComparisonResult)compare:(id)obj1 with:(id)obj2 {
    if (!obj2 || !obj1) return -404;
    
    NSDecimalNumber *one;
    NSDecimalNumber *another;
    
    if ([obj1 isKindOfClass:[NSString class]]) {
        one = [NSDecimalNumber decimalNumberWithString:obj1];
    }else if([obj1 isKindOfClass:[NSDecimalNumber class]]){
        one = obj1;
    }else if ([obj1 isKindOfClass:[NSNumber class]]){
        one = [NSDecimalNumber decimalNumberWithDecimal:[obj1 decimalValue]];
    }else{
        return -404;
    }
    
    if ([obj2 isKindOfClass:[NSString class]]) {
        another = [NSDecimalNumber decimalNumberWithString:obj2];
    }else if([obj2 isKindOfClass:[NSDecimalNumber class]]){
        another = obj2;
    }else if ([obj2 isKindOfClass:[NSNumber class]]){
        another = [NSDecimalNumber decimalNumberWithDecimal:[obj2 decimalValue]];
    }else{
        return -404;
    }
    return [one compare:another];
}

+ (NSDecimalNumber *)add:(id)obj1 with:(id)obj2 {
    return [NSDecimalNumber decimalNumber:obj1 with:obj2 type:THCalAdd completeHandler:nil];
}

+ (NSDecimalNumber *)sub:(id)obj1 with:(id)obj2 {
    return [NSDecimalNumber decimalNumber:obj1 with:obj2 type:THCalSubtract completeHandler:nil];
}

+ (NSDecimalNumber *)div:(id)obj1 with:(id)obj2 {
    return [NSDecimalNumber decimalNumber:obj1 with:obj2 type:THCalDivide completeHandler:nil];
}

+ (NSDecimalNumber *)mul:(id)obj1 with:(id)obj2 {
    return [NSDecimalNumber decimalNumber:obj1 with:obj2 type:THCalMultiply completeHandler:nil];
}

+ (NSDecimalNumber *)min:(id)obj1 with:(id)obj2 {
    if (!obj2 || !obj1) return nil;
    NSDecimalNumber *one = [NSDecimalNumber creatDecimalNumWith:obj1];
    NSDecimalNumber *another = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    if ([one compare:another] == NSOrderedAscending) {
        return one;
    }else {
        return another;
    }
}

+ (NSDecimalNumber *)max:(id)obj1 with:(id)obj2 {
    NSDecimalNumber *one = [NSDecimalNumber creatDecimalNumWith:obj1];
    NSDecimalNumber *another = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    if ([one compare:another] == NSOrderedAscending) {
        return another;
    }else {
        return one;
    }
}

#pragma mark - private
+ (NSDecimalNumber *)creatDecimalNumWith:(id)obj {
    NSDecimalNumber *res;
    
    if ([obj isKindOfClass:[NSString class]]) {
        res = [NSDecimalNumber decimalNumberWithString:obj];
    }else if([obj isKindOfClass:[NSDecimalNumber class]]){
        res = obj;
    }else if ([obj isKindOfClass:[NSNumber class]]){
        res = [NSDecimalNumber decimalNumberWithDecimal:[obj decimalValue]];
    }else{
        return nil;
    }
    return res;
}
@end
