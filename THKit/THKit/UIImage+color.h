//
//  UIImage+color.h
//  THKit
//
//  Created by Terence Yang on 2021/7/26.
//

#import <UIKit/UIKit.h>

@interface UIImage (color)

/// creat image with color and size
/// @param color color
/// @param size size
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

/// background image generator
/// @param width image width
/// @param height image height
/// @param gradientColors gradient colors
/// @param gradientLocations gradient locations
+ (UIImage *)creatBgImgWithBgWidth:(CGFloat)width
                            height:(CGFloat)height
                    gradientColors:(NSArray *)gradientColors
                 gradientLocations:(CGFloat *)gradientLocations;

/// background image generator
/// @param width image width
/// @param height image height
/// @param cornerRadio cornerRadio
/// @param gradientColors gradient colors
/// @param gradientLocations gradient locations
/// @param gradientBorderColors gradient border colors
/// @param gradientBorderLocations gradient border locations
+ (UIImage *)creatBgImgWithBgWidth:(CGFloat)width
                            height:(CGFloat)height
                       cornerRadio:(CGFloat)cornerRadio
                    gradientColors:(NSArray *)gradientColors
                 gradientLocations:(CGFloat *)gradientLocations
              gradientBorderColors:(NSArray *)gradientBorderColors
     gradientBorderColorsLocations:(CGFloat *)gradientBorderLocations;


/// background image generator
/// @param width image width
/// @param height image height
/// @param shadowColor shadowColor
/// @param shadowWidth shadow width
/// @param shadowColorOffset shadow color offset
/// @param shadowBlur shadow blur
/// @param cornerRadio cornerRadio
/// @param gradientColors gradient colors
/// @param gradientLocations gradient locations
/// @param gradientBorderColors gradient border colors
/// @param gradientBorderLocations gradient border locations
+ (UIImage *)creatBgImgWithBgWidth:(CGFloat)width
                            height:(CGFloat)height
                       shadowColor:(UIColor *)shadowColor
                       shadowWidth:(CGFloat)shadowWidth
                 shadowColorOffset:(CGSize)shadowColorOffset
                        shadowBlur:(CGFloat)shadowBlur
                       cornerRadio:(CGFloat)cornerRadio
                    gradientColors:(NSArray *)gradientColors
                 gradientLocations:(CGFloat *)gradientLocations
              gradientBorderColors:(NSArray *)gradientBorderColors
     gradientBorderColorsLocations:(CGFloat *)gradientBorderLocations;

@end
