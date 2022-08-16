//
//  NSString+URLEncode.m
//  THKit
//
//  Created by Terence Yang on 2021/7/31.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)URLDecode {
    NSString *replaceStr = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    
    return [replaceStr stringByRemovingPercentEncoding];
}

// Replace one by one
- (NSString *)URLEncode {
    NSMutableString *resStrM = [NSMutableString string];
    
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    
    unsigned long sourceLen = strlen((const char *)source);
    
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char cur = source[i];
        if (cur == ' '){
            [resStrM appendString:@"+"];
        } else if (cur == '.' ||
                   cur == '-' ||
                   cur == '_' ||
                   cur == '~' ||
                   (cur >= 'a' && cur <= 'z') ||
                   (cur >= 'A' && cur <= 'Z') ||
                   (cur >= '0' && cur <= '9')) {
            [resStrM appendFormat:@"%c", cur];
        } else {
            [resStrM appendFormat:@"%%%02X", cur];
        }
    }
    return [resStrM copy];
}

- (NSString *)URLEncode:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ", CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)URLDecode:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(encoding));
}

+ (NSDictionary *)fetchDictFromQuery:(NSString *)query {
    if (query.length < 1) { return nil; }
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    NSArray *params = [query componentsSeparatedByString:@"&"];
    
    if (![params count]) { return nil; }
    
    for (NSString *param in params) {
        NSRange range = [param rangeOfString:@"="];
        
        if (range.location != NSNotFound) {
            NSString *key = [param substringToIndex:range.location];
            
            NSString *value = [param substringFromIndex:range.location + 1];
            
            if (key && value) {
                [result setValue:value forKey:key];
            }
        }
    }
    
    return result;
}

@end
