//
//  UILabel+Copy.m
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import "UILabel+Copy.h"
#import <objc/runtime.h>

static void * const kCopyEnabled = "kCopyEnabled";

static void * const kLongPressGestureRecognizer = "kLongPressGestureRecognizer";

@implementation UILabel (Copy)

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copy:) && self.isCopyEnabled);
}

- (void)copy:(id)sender {
    if (self.isCopyEnabled) {
        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
        
        pboard.string = self.text;
    }
}

- (BOOL)canBecomeFirstResponder {
    return self.isCopyEnabled;
}

#pragma mark - private
- (void)setUpGestureRecognizer {
    if (self.longPressGestureRecognizer) {
        [self removeGestureRecognizer:self.longPressGestureRecognizer];
        self.longPressGestureRecognizer = nil;
    }
    
    if (self.isCopyEnabled) {
        self.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer *re = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(longPressGestureRecognized:)];
        
        self.longPressGestureRecognizer = re;
        [self addGestureRecognizer:re];
    }
}

- (void)longPressGestureRecognized:(UIGestureRecognizer *)ge {
    if (self.longPressGestureRecognizer && ge.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        UIMenuController *menuC = [UIMenuController sharedMenuController];
        
        if (@available(iOS 13.0, *)) {
            [menuC showMenuFromView:self rect:self.bounds];
        } else {
            [menuC setTargetRect:self.bounds inView:self];
            [menuC setMenuVisible:YES];
        }
    }
}

#pragma mark - setter/getter
- (UILongPressGestureRecognizer *)longPressGestureRecognizer {
    return objc_getAssociatedObject(self, &kLongPressGestureRecognizer);
}

- (void)setLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    objc_setAssociatedObject(self, &kLongPressGestureRecognizer, longPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isCopyEnabled {
    return [objc_getAssociatedObject(self, &kCopyEnabled) boolValue];
}

- (void)setIsCopyEnabled:(BOOL)isCopyEnabled {
    objc_setAssociatedObject(self, &kCopyEnabled, [NSNumber numberWithBool:isCopyEnabled], OBJC_ASSOCIATION_ASSIGN);
    [self setUpGestureRecognizer];
}

@end
