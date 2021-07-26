//
//  UIImage+color.m
//  THKit
//
//  Created by Terence Yang on 2021/7/26.
//

#import "UIImage+color.h"

@implementation UIImage (color)

/// background image generator
/// @param width image width
/// @param height image height
/// @param gradientColors gradient colors
/// @param gradientLocations gradient locations
+ (UIImage *)creatBgImgWithBgWidth:(CGFloat)width
                            height:(CGFloat)height
                    gradientColors:(NSArray *)gradientColors
                 gradientLocations:(CGFloat *)gradientLocations {
    return [UIImage creatBgImgWithBgWidth:width height:height cornerRadio:0 gradientColors:gradientColors gradientLocations:gradientLocations gradientBorderColors:nil gradientBorderColorsLocations:nil];
}

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
     gradientBorderColorsLocations:(CGFloat *)gradientBorderLocations {
    return [UIImage creatBgImgWithBgWidth:width height:height shadowColor:nil shadowWidth:0 shadowColorOffset:CGSizeZero shadowBlur:0 cornerRadio:cornerRadio gradientColors:gradientColors gradientLocations:gradientLocations gradientBorderColors:gradientBorderColors gradientBorderColorsLocations:gradientBorderLocations];
}

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
     gradientBorderColorsLocations:(CGFloat *)gradientBorderLocations {
    NSInteger w = width - shadowColorOffset.width;
    NSInteger h = height - shadowColorOffset.height;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    
    //阴影
    if (shadowColor) {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextSetShadowWithColor(context, shadowColorOffset, shadowBlur, shadowColor.CGColor);
        if (cornerRadio > 0.000001) {
            CGContextAddPath(context, CGPathCreateWithRoundedRect(CGRectMake(shadowColorOffset.width, shadowColorOffset.height, w - shadowColorOffset.width, h - shadowColorOffset.height), cornerRadio, cornerRadio, NULL));
            CGContextFillPath(context);
        } else {
            CGRect rect = CGRectMake(shadowColorOffset.width, shadowColorOffset.height, w - shadowColorOffset.width, h - shadowColorOffset.height);
            CGContextFillRect(context, rect);
        }
    }
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    //圆角
    if (cornerRadio > 0.00001) {
        CGPathMoveToPoint(path, NULL, 0, cornerRadio);
        CGPathAddArcToPoint(path, NULL, 0, 0, cornerRadio, 0, cornerRadio);
        CGPathAddLineToPoint(path, NULL, w - cornerRadio, 0);
        CGPathAddArcToPoint(path, NULL, w, 0, w, cornerRadio, cornerRadio);
        CGPathAddLineToPoint(path, NULL, w, h - cornerRadio);
        CGPathAddArcToPoint(path, NULL, w, h, w - cornerRadio, h, cornerRadio);
        CGPathAddLineToPoint(path, NULL, cornerRadio, h);
        CGPathAddArcToPoint(path, NULL, 0, h, 0, h - cornerRadio, cornerRadio);
        CGPathAddLineToPoint(path, NULL, 0, cornerRadio);
    }else {
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, w, 0);
        CGPathAddLineToPoint(path, NULL, w, h);
        CGPathAddLineToPoint(path, NULL, 0, h);
        CGPathAddLineToPoint(path, NULL, 0, 0);
    }

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    //整体渐变色
    NSInteger gradientColorsCount = gradientColors.count;
    
    if (gradientColorsCount > 0) {
        NSMutableArray *colorsM = [NSMutableArray arrayWithCapacity:gradientColors.count];

        for (UIColor *color in gradientColors) {
            [colorsM addObject:(__bridge id)(color.CGColor)];
        }

        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colorsM, gradientLocations);
        
        CGContextAddPath(context, path);
        CGContextClip(context);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0, 0.0), CGPointMake(0.0, h), kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGGradientRelease(gradient);
    }

    //边框
    NSInteger gradientBorderColorCount = gradientBorderColors.count;
    
    if (gradientBorderColorCount > 0) {
        NSMutableArray *colorsM1 = [NSMutableArray arrayWithCapacity:gradientBorderColors.count];

        for (UIColor *color in gradientBorderColors) {
            [colorsM1 addObject:(__bridge id)(color.CGColor)];
        }

        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colorsM1, gradientBorderLocations);
        
        CGContextSetLineWidth(context, shadowWidth);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextAddPath(context, path);
        CGContextReplacePathWithStrokedPath(context);
        CGContextClip(context);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0, 0.0), CGPointMake(0.0, h), kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGGradientRelease(gradient);
    }
    
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    CGColorSpaceRelease(colorSpace);
    CGPathRelease(path);
    
    return resultImg;
}

@end
