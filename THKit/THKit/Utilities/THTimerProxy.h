//
//  THTimerProxy.h
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THTimerProxy : NSProxy

@property(nonatomic, weak) id target;

+ (instancetype)target:(id)target;

@end

NS_ASSUME_NONNULL_END
