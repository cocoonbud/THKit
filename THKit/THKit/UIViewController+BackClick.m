//
//  UIViewController+BackClick.m
//  THKit
//
//  Created by Terence Yang on 2021/7/30.
//

#import "UIViewController+BackClick.h"
#import <objc/runtime.h>

static const void *kBtnClickedKey = &kBtnClickedKey;

@implementation UIViewController (BackAction)

- (void)backBtnClicked:(THBackBtnClickedBlock)block {
    objc_setAssociatedObject(self, kBtnClickedKey, block, OBJC_ASSOCIATION_COPY);
}

- (THBackBtnClickedBlock)backClickedBlock {
    return objc_getAssociatedObject(self, kBtnClickedKey);
}

@end

@implementation UINavigationController (_)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    UIViewController* vc = [self topViewController];
    THBackBtnClickedBlock handler = [vc backClickedBlock];
    if (handler) {
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.f) {
                [UIView animateWithDuration:0.25 animations:^{
                    subview.alpha = 1.f;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }
    return NO;
}
@end
