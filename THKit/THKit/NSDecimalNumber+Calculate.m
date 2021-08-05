//
//  NSDecimalNumber+Calculate.m
//  THKit
//
//  Created by Terence Yang on 2021/8/4.
//

#import "NSDecimalNumber+Calculate.h"

@implementation NSDecimalNumber (Calculate)

+ (NSDecimalNumber *)decimalNumber:(id)obj1 roundingMode:(NSRoundingMode)mode scale:(int)scale {
    if (!obj1) return nil;
    
    NSDecimalNumber *num1 = [NSDecimalNumber creatDecimalNumWith:obj1];

    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    return  [num1 decimalNumberByRoundingAccordingToBehavior:handler];
}

+ (NSDecimalNumber *)decimalNumber:(id)obj1 with:(id)obj2 type:(THCalType)type completeHandler:(NSDecimalNumberHandler * __nullable)handler {
    if (!obj2 || !obj1) return nil;
    
    NSDecimalNumber *num1 = [NSDecimalNumber creatDecimalNumWith:obj1];
    
    NSDecimalNumber *num2 = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    NSDecimalNumber *returnNum = nil;
    
    switch (type) {
        case THCalAdd: {
            returnNum = [num1 decimalNumberByAdding:num2];
        }
            break;
        case THCalSubtract: {
            returnNum  = [num1 decimalNumberBySubtracting:num2];
        }
            break;
        case THCalMultiply: {
            returnNum = [num1 decimalNumberByMultiplyingBy:num2];
        }
            break;
        case THCalDivide: {
            if ([NSDecimalNumber compare:num2 with:@(0)] != NSOrderedSame) {
                returnNum = [num1 decimalNumberByDividingBy:num2];
            }
        }
            break;
    }

    if (returnNum) {
        if (handler) {
            return [returnNum decimalNumberByRoundingAccordingToBehavior:handler];
        }
    }
    return returnNum;
}

+ (NSComparisonResult)compare:(id)obj1 with:(id)obj2 {
    if (!obj2 || !obj1) return -101;
    
    NSDecimalNumber *num1 = [NSDecimalNumber creatDecimalNumWith:obj1];
    
    NSDecimalNumber *num2 = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    if (!num1 || !num2) return -101;
   
    return [num1 compare:num2];
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
    
    NSDecimalNumber *num1 = [NSDecimalNumber creatDecimalNumWith:obj1];
    
    NSDecimalNumber *num2 = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    return ([num1 compare:num2] == NSOrderedAscending) ? num1 : num2;
}

+ (NSDecimalNumber *)max:(id)obj1 with:(id)obj2 {
    if (!obj2 || !obj1) return nil;
    
    NSDecimalNumber *num1 = [NSDecimalNumber creatDecimalNumWith:obj1];
    
    NSDecimalNumber *num2 = [NSDecimalNumber creatDecimalNumWith:obj2];
    
    return ([num1 compare:num2] == NSOrderedAscending) ? num2 : num1;
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
