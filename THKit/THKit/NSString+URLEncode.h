//
//  NSString+URLEncode.h
//  THKit
//
//  Created by Terence Yang on 2021/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncode)

/// URL encode ( Replace one by one)
- (NSString *)URLEncode;

/// URL decode
- (NSString *)URLDecode;

/// URL encode
/// @param encoding encoding
- (NSString *)URLEncode:(NSStringEncoding)encoding;

/// URL decode
/// @param encoding encoding
- (NSString *)URLDecode:(NSStringEncoding)encoding;

/// Get QueryString in URL string
+ (NSDictionary *)fetchDictFromQuery:(NSString *)query;

@end

NS_ASSUME_NONNULL_END
