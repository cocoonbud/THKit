//
//  NSObject+THAutoDestructNoti.h
//  THKit
//
//  Created by Terence Yang on 2021/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class THDestructNoti;

typedef void(^THDestructNotiBlock)(THDestructNoti *notify);

@interface THDestructNoti : NSObject

@property (nonatomic, strong) NSString *__nullable name;

@property (nonatomic, strong) NSDictionary *__nullable userInfo;

@property (nonatomic, strong) THDestructNotiBlock __nullable block;

@end

@interface NSObject (THAutoDestructNoti)

- (NSMutableDictionary *)thDestructNotiDictionary;

- (void)th_destructNotiSetName:(NSString *)name block:(THDestructNotiBlock)block;

- (void)th_destructNotiSetName:(NSString *)name userInfo:(NSDictionary *__nullable)userInfo block:(THDestructNotiBlock)block;

- (void)th_destructNotiRemoveWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
