//
//  NSException+THTrackLog.m
//  THKit
//
//  Created by Terence Yang on 2021/8/9.
//

#import "NSException+THTrackLog.h"
#include <execinfo.h>

@implementation NSException (THTrackLog)

- (NSArray *)th_backtrace {
    NSArray *add = self.callStackReturnAddresses;
    
    unsigned count = (int)add.count;
    
    void **stack = malloc(count * sizeof(void *));
    
    for (unsigned i = 0; i < count; ++i) {
        stack[i] = (void *)[add[i] longValue];
    }
    
    char **str = backtrace_symbols(stack, count);
    
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i) {
        [ret addObject:@(str[i])];
    }
    
    free(stack);
    free(str);
    
    return ret;
}
@end
