//
//  UIViewController+BackButtonHandler.m
//  THKit
//
//  Created by Terence Yang on 2021/8/2.
//

#import "UIViewController+BackButtonHandler.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

static void * const interactivePopGestureDelegate = "interactivePopGestureDelegate";

@implementation UINavigationController (navigationPopBack)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(navigationBar:shouldPopItem:) bySwizzlingedSelector:@selector(th_navigationBar:shouldPopItem:)];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    objc_setAssociatedObject(self, interactivePopGestureDelegate, self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (BOOL)th_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    UIViewController *vc = [self topViewController];
    
    if (item != vc.navigationItem) { return YES; }
    if ([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        if ([vc navigationShouldPopOnBackButton]) {
            return [self th_navigationBar:navigationBar shouldPopItem:item];
        } else{
            for (UIView *subview in [navigationBar subviews]) {
                if (subview.alpha > 0 && subview.alpha < 1.f) {
                    [UIView animateWithDuration:.25f animations:^{
                        subview.alpha = 1;
                    }];
                }
            }
            return NO;
        }
    } else{
        return [self th_navigationBar:navigationBar shouldPopItem:item];
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count == 1) {
            return NO;
        }
            
        UIViewController *vc = self.topViewController;
        
        if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
            return [vc navigationShouldPopOnBackButton];
        }
            
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, interactivePopGestureDelegate);
        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }
    return YES;
}
@end
