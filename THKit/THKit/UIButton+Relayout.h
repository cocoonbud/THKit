//
//  UIButton+Relayout.h
//  THKit
//
//  Created by Terence Yang on 2021/8/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, THButtonStyle) {
    THButtonStyleUp,          // img上，label下
    THButtonStyleNormal,      // img左，label右
    THButtonStyleDown,        // img下，label上
    THButtonStyleRight        // img右，label左
};

@interface UIButton (Relayout)

/// Set the layout style and space of the button's titleLabel and imageView
/// @param btnStyle relayout style
/// @param space space
- (void)reLayoutBtnWithStyle:(THButtonStyle)btnStyle space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
