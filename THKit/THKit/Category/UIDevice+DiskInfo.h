//
//  UIDevice+DiskInfo.h
//  THKit
//
//  Created by Terence Yang on 2021/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DiskInfo)

/// 硬盘空间
@property (nonatomic,readonly) int64_t diskSpace;

/// 硬盘剩余空间
@property (nonatomic,readonly) int64_t diskSpaceFree;

/// 硬盘使用空间
@property (nonatomic,readonly) int64_t diskSpaceUsed;

/// 内存空间
@property (nonatomic, readonly) int64_t memTotal;

/// 内存使用空间
@property (nonatomic, readonly) int64_t memUsed;

/// 内存剩余空间
@property (nonatomic, readonly) int64_t memFree;

/// 内存活动空间
@property (nonatomic, readonly) int64_t memActive;

/// 内存非活动时间
@property (nonatomic, readonly) int64_t memInactive;

/// 内存压缩空间
@property (nonatomic, readonly) int64_t memWired;
///
@property (nonatomic, readonly) int64_t memPurgable;

@end

NS_ASSUME_NONNULL_END
