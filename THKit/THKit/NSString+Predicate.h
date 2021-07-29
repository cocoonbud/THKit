//
//  NSString+Predicate.h
//  THKit
//
//  Created by Terence Yang on 2021/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Predicate)

/// 检测是否有效的电话号码
- (BOOL)isValidMobileNumber;

/// 检测是否有效的验证码
- (BOOL)isValidVerifyCode;

/// 检测是否有效的真实姓名
- (BOOL)isValidRealName;

/// 检测是否是纯中文
- (BOOL)isPureChinese;

/// 检测是否纯数字
- (BOOL)isPureNumber;

/// 检测是否有效的银行卡号(一般卡号15 or 19位)
- (BOOL)isValidBankCardNumber;

/// 检测是否有效的邮箱
- (BOOL)isValidEmail;

/// 检测是否有效的字母数字密码
- (BOOL)isValidLetterAndNumberPassword;

/// 检测是否有效身份证
- (BOOL)isValidIDNum;

@end

NS_ASSUME_NONNULL_END
