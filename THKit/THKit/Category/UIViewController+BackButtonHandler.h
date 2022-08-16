//
//  UIViewController+BackButtonHandler.h
//  THKit
//
//  Created by Terence Yang on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BackButtonHandlerProtocol <NSObject>

@optional

- (BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end


@interface UINavigationController (navigationPopBack)

@end

NS_ASSUME_NONNULL_END
