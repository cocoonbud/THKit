//
//  THGCDTimer.h
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THGCDTimer : NSObject

+ (NSString *)executeWithInterval:(NSTimeInterval)ti
                            start:(NSTimeInterval)start
                            async:(BOOL)async
                          repeats:(BOOL)repeats
                             task:(void(^)(void))task;

+ (NSString *)executeWithInterval:(NSTimeInterval)ti
                            start:(NSTimeInterval)start
                            async:(BOOL)async
                           target:(id)target
                         selector:(SEL)aSelector
                          repeats:(BOOL)repeats;

+ (void)cancelTaskWithName:(NSString *)taskName;

@end

NS_ASSUME_NONNULL_END
