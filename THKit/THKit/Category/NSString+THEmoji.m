//
//  NSString+THEmoji.m
//  THKit
//
//  Created by Terence Yang on 2021/8/9.
//

#import "NSString+THEmoji.h"

@implementation NSString (THEmoji)

//编码
- (NSString *)emojiEncode{
    NSString *str = [NSString stringWithUTF8String:[self UTF8String]];
    
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    
    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return res;
}
 
//解码
- (NSString *)emojiDecode{
    const char *jsonStr = [self UTF8String];
    
    NSData *data = [NSData dataWithBytes:jsonStr length:strlen(jsonStr)];
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
    
    return str;
}

@end
