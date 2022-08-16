//
//  NSString+QRCode.m
//  THKit
//
//  Created by Terence Yang on 2021/8/1.
//

#import "NSString+QRCode.h"

@implementation NSString (QRCode)

- (UIImage *)creatQRcodeWithSize:(CGSize)size logo:(UIImage *)logo {
    return [self creatQRcodeWithSize:size foregroundColor:nil backgroundColor:nil logo:logo];
}

- (UIImage *)creatQRcodeWithSize:(CGSize)size {
    return [self creatQRcodeWithSize:size foregroundColor:nil backgroundColor:nil logo:nil];
}

- (UIImage *)creatQRcodeWithSize:(CGSize)size
                 foregroundColor:(UIColor *)foregroundColor
                 backgroundColor:(UIColor *)backgroundColor
                            logo:(UIImage *)logo {
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"
                              withInputParameters:@{@"inputMessage":stringData,
                                                    @"inputCorrectionLevel": @"M"}];
    
    CIImage *outputImage = [qrFilter outputImage];
    
    if (foregroundColor || backgroundColor) {
        CIFilter *filter = [CIFilter filterWithName:@"CIFalseColor"];
        
        [filter setDefaults];
        [filter setValue:outputImage forKey:@"inputImage"];
        
        if (foregroundColor) {
            [filter setValue:[CIColor colorWithCGColor:foregroundColor.CGColor] forKey:@"inputColor0"];
        }
        
        if (backgroundColor) {
            [filter setValue:[CIColor colorWithCGColor:backgroundColor.CGColor] forKey:@"inputColor1"];
        }
        
        outputImage = filter.outputImage;
    }
    
    CGRect integralRect = outputImage.extent;
    
    CGImageRef imgRef = [[CIContext context] createCGImage:outputImage fromRect:integralRect];
    
    CGFloat sideScale = fminf(size.width / integralRect.size.width,
                              size.width / integralRect.size.height) * [UIScreen mainScreen].scale;
    
    size_t contextRefWidth = ceilf(integralRect.size.width * sideScale);
    
    size_t contextRefHeight = ceilf(integralRect.size.height * sideScale);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef contextRef = CGBitmapContextCreate(nil,
                                                    contextRefWidth,
                                                    contextRefHeight,
                                                    8,
                                                    0,
                                                    colorSpace,
                                                    kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextSetInterpolationQuality(contextRef, kCGInterpolationNone);
    CGContextScaleCTM(contextRef, sideScale, sideScale);
    CGContextDrawImage(contextRef, integralRect, imgRef);
    
    CGImageRef scaledImgRef = CGBitmapContextCreateImage(contextRef);
    
    CGContextRelease(contextRef);
    CGImageRelease(imgRef);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *scaledImage = [UIImage imageWithCGImage:scaledImgRef
                                               scale:[UIScreen mainScreen].scale
                                         orientation:UIImageOrientationUp];
    
    if (logo) {
        scaledImage = [self combinateQrCodeImage:scaledImage andLogo:logo];
    }
    
    return scaledImage;
}

// Combine the QR code and the logo into one image
- (UIImage *)combinateQrCodeImage:(UIImage *)codeImage andLogo:(UIImage *)logo {
    UIGraphicsBeginImageContextWithOptions(codeImage.size, YES, [UIScreen mainScreen].scale);
    [codeImage drawInRect:CGRectMake(0, 0, codeImage.size.width, codeImage.size.height)];
    
    CGFloat logoW = fminf(codeImage.size.width, codeImage.size.height) / 4;
    CGFloat logoX = (codeImage.size.width - logoW) / 2;
    CGFloat logoY = (codeImage.size.height - logoW) / 2;
    CGRect logoRect = CGRectMake(logoX, logoY, logoW, logoW);
    
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:logoRect cornerRadius:logoW / 4];
    
    [[UIColor whiteColor] set];
    [cornerPath setLineWidth:1.f];
    [cornerPath stroke];
    [cornerPath addClip];
    [logo drawInRect:logoRect];
    codeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return codeImage;
}

@end
