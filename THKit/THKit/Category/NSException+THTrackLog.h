//
//  NSException+THTrackLog.h
//  THKit
//
//  Created by Terence Yang on 2021/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSException (THTrackLog)

- (NSArray *)th_backtrace;

@end

NS_ASSUME_NONNULL_END
