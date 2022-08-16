//
//  UIColor+Hex.h
//  THKit
//
//  Created by Terence Yang on 2021/7/26.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (instancetype)randomColor;

+ (UIColor *)colorWithHex:(NSString *)hexColorStr;

+ (UIColor *)colorWithHex:(NSString *)hexColorStr alpha:(CGFloat)alpha;

+ (UIColor *)HEXColor:(uint32_t)colorHex alpha:(CGFloat)alpha;

/// Return Hex String of color with number sign '#', or not. Such as '#AA11BB' or 'AA11BB'
- (NSString *)hexStringWithNumberSign:(BOOL)hasNumberSign;

@end
