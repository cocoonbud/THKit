//
//  NSString+URLEncode.h
//  THKit
//
//  Created by Terence Yang on 2021/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncode)

/**
 urlEncode

 @return urlEncode
 */
- (NSString *)URLEncode;

/**
 urlEncodeUsingEncoding

 @param encoding Encoding
 @return urlEncodeUsingEncoding
 */
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;


/**
 urlDecode
 @return urlDecode
 */
- (NSString *)urlDecode;

/**
 urlDecodeUsingEncoding
 @param encoding Encoding
 @return urlDecodeUsingEncoding
 */
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;

@end

NS_ASSUME_NONNULL_END
