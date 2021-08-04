//
//  NSDecimalNumber+Calculate.h
//  THKit
//
//  Created by Terence Yang on 2021/8/4.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, THCalType) {
    THCalAdd,
    THCalSubtract,
    THCalMultiply,
    THCalDivide
};

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (Calculate)

+ (NSComparisonResult)compare:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)decimalNumber:(id)obj1 with:(id)obj2 type:(THCalType)type completeHandler:(NSDecimalNumberHandler *)handler;

+ (NSDecimalNumber *)add:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)sub:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)mul:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)div:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)min:(id)obj1 with:(id)obj2;

+ (NSDecimalNumber *)max:(id)obj1 with:(id)obj2;

@end

NS_ASSUME_NONNULL_END
