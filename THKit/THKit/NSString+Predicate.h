//
//  NSString+Predicate.h
//  THKit
//
//  Created by Terence Yang on 2021/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Predicate)

/// 有效的电话号码
- (BOOL)isValidMobileNumber;

/// 有效的真实姓名
- (BOOL)isValidRealName;

/// 是否是纯中文
- (BOOL)isPureChinese;

/// 有效的验证码(根据自家的验证码位数进行修改)
- (BOOL)isValidVerifyCode;

/// 有效的银行卡号
- (BOOL)isValidBankCardNumber;

/// 有效的邮箱
- (BOOL)isValidEmail;

/// 有效的字母数字密码
- (BOOL)isValidAlphaNumberPassword;

/// 检测有效身份证
/// @param num 身份证位数
- (BOOL)isValidIDWithNum:(NSInteger)num;

/// 限制只能输入数字
- (BOOL)isOnlyNumber;

@end

NS_ASSUME_NONNULL_END
