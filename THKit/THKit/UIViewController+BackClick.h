//
//  UIViewController+BackClick.h
//  THKit
//
//  Created by Terence Yang on 2021/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^THBackBtnClickedBlock)(UINavigationController *vc);

@interface UIViewController (BackClick)

- (void)backBtnClicked:(THBackBtnClickedBlock)block;

@end

NS_ASSUME_NONNULL_END
