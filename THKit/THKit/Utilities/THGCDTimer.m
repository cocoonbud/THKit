//
//  THGCDTimer.m
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import "THGCDTimer.h"

#define IgnorePerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

@implementation THGCDTimer

dispatch_semaphore_t semaphore;

static NSMutableDictionary *timersDictM;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        semaphore = dispatch_semaphore_create(1);
        timersDictM = [NSMutableDictionary dictionary];
    });
}

+ (NSString *)executeWithInterval:(NSTimeInterval)ti
                            start:(NSTimeInterval)start
                            async:(BOOL)async
                          repeats:(BOOL)repeats
                             task:(void(^)(void))task {
    if (start < 0.000001 || (ti <= 0.000001 && repeats) || !task) return nil;
    
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(source, dispatch_time(DISPATCH_TIME_NOW, (uint64_t)(start * NSEC_PER_SEC)), (uint64_t)(ti * NSEC_PER_SEC), 0);
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSString *taskName = [NSString stringWithFormat:@"%lu", (unsigned long)timersDictM.count];
    
    timersDictM[taskName] = source;
    
    dispatch_semaphore_signal(semaphore);
    
    dispatch_source_set_event_handler(source, ^{
        task();
        
        if (!repeats) {
            [self cancelTaskWithName:taskName];
        }
    });
    
    dispatch_resume(source);
    
    return taskName;
}

+ (NSString *)executeWithInterval:(NSTimeInterval)ti
                            start:(NSTimeInterval)start
                            async:(BOOL)async
                           target:(id)target
                         selector:(SEL)aSelector
                          repeats:(BOOL)repeats {
    if (!target || !aSelector) return nil;
    
    return [self executeWithInterval:ti start:start async:async repeats:repeats task:^{
        if ([target respondsToSelector:aSelector]) {
            IgnorePerformSelectorLeakWarning([target performSelector:aSelector]);
        }
    }];
}

+ (void)cancelTaskWithName:(NSString *)taskName {
    if (taskName.length == 0) return;
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = timersDictM[taskName];
    
    if (timer) {
        dispatch_source_cancel(timer);
        [timersDictM removeObjectForKey:taskName];
    }

    dispatch_semaphore_signal(semaphore);
}

@end
