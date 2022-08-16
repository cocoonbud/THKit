//
//  THTimerProxy.m
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import "THTimerProxy.h"

@implementation THTimerProxy

+ (instancetype)target:(id)target {
    THTimerProxy *proxy = [THTimerProxy alloc];
    
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
