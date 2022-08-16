//
//  NSString+QRCode.h
//  THKit
//
//  Created by Terence Yang on 2021/8/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QRCode)

/// creat QR Code
/// @param size  img size
- (UIImage *)creatQRcodeWithSize:(CGSize)size;

/// creat QR Code
/// @param size  img size
/// @param logo logo img
- (UIImage *)creatQRcodeWithSize:(CGSize)size logo:(UIImage *)logo;

/// creat QR Code
/// @param size size
/// @param foregroundColor QR Code color
/// @param backgroundColor bg color
/// @param logo logo
- (UIImage *)creatQRcodeWithSize:(CGSize)size foregroundColor:(UIColor * __nullable)foregroundColor
                 backgroundColor:(UIColor * __nullable)backgroundColor
                            logo:(UIImage * __nullable)logo;

@end

NS_ASSUME_NONNULL_END
