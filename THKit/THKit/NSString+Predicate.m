//
//  NSString+Predicate.m
//  THKit
//
//  Created by Terence Yang on 2021/7/28.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)

- (BOOL)isValidMobileNumber {
    NSString *const str = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidVerifyCode {
    NSString *str = @"^[0-9]{4}";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidRealName {
    NSString *str = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isPureChinese {
    NSString *str = @"^[\u4e00-\u9fa5]{0,}$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isPureNumber {
    NSString *const str = @"^[0-9]*$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidBankCardNumber {
    NSString *const str = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidEmail {
    NSString *str = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)validateNickName {
    NSString *str = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,24}+$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidAlphaNumberPassword {
    NSString *str = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

- (BOOL)isValidIDNum {
    NSString *str = @"(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)";
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    
    return [p evaluateWithObject:self];
}

@end
