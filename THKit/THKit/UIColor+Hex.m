//
//  UIColor+Hex.m
//  THKit
//
//  Created by Terence Yang on 2021/7/26.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (instancetype)randomColor {
    return [UIColor colorWithRed:(arc4random() % 255)/255.0 green:(arc4random() % 255)/255.0 blue:(arc4random() % 255)/255.0 alpha:1];
}

+ (UIColor *)colorWithHex:(NSString *)hexColorStr {
    return [self colorWithHex:hexColorStr alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSString *)hexColorStr alpha:(CGFloat)alpha {
    NSString *cStr = [[hexColorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (cStr.length != 7) {
        return [UIColor clearColor];
    }
    
    uint32_t colorHex = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:cStr];
    
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&colorHex];
    
    return [self HEXColor:colorHex alpha:alpha];
}

+ (UIColor *)HEXColor:(uint32_t)colorHex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((colorHex & 0xFF0000) >> 16))/255.0
                           green:((float)((colorHex & 0xFF00) >> 8))/255.0
                            blue:((float)(colorHex & 0xFF))/255.0 alpha:alpha];
}

- (NSString *)hexStringWithNumberSign:(BOOL)hasNumberSign {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%@%02lX%02lX%02lX",
            hasNumberSign ? @"#" : @"",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}
@end
