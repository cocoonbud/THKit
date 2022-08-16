//
//  UIButton+Relayout.m
//  THKit
//
//  Created by Terence Yang on 2021/8/25.
//

#import "UIButton+Relayout.h"

@implementation UIButton (Relayout)

- (void)reLayoutBtnWithStyle:(THButtonStyle)btnStyle space:(CGFloat)space {
    CGFloat labelW = self.titleLabel.intrinsicContentSize.width;
    CGFloat labelH = self.titleLabel.intrinsicContentSize.height;
    CGFloat imgW = self.imageView.frame.size.width;
    CGFloat imgH = self.imageView.frame.size.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (btnStyle) {
        case THButtonStyleUp: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelH - space / 2.0, 0, 0, -labelW);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imgW, -imgH - space / 2.0, 0);
        }
            break;
        case THButtonStyleNormal: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2.0, 0, space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space / 2.0, 0, -space / 2.0);
        }
            break;
        case THButtonStyleDown: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelH - space / 2.0, -labelW);
            labelEdgeInsets = UIEdgeInsetsMake(-imgH - space / 2.0, -imgW, 0, 0);
        }
            break;
        case THButtonStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelW + space / 2.0, 0, -labelW - space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imgW - space / 2.0, 0, imgW + space / 2.0);
        }
            break;
    }
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end

