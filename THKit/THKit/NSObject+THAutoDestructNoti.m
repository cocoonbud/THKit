//
//  NSObject+THAutoDestructNoti.m
//  THKit
//
//  Created by Terence Yang on 2021/8/10.
//

#import "NSObject+THAutoDestructNoti.h"
#import <objc/runtime.h>

static void *kTHAutoDestructNotiKey = "kTHAutoDestructNoti";

@implementation THDestructNoti

@synthesize name = _name;
@synthesize userInfo = _userInfo;
@synthesize block = _block;

- (void)dealloc {
    THDestructNotiBlock block = [self block];
    
    if (!block) block(self);
    
    _block = nil;
    _userInfo = nil;
    _name = nil;
}

@end

@implementation NSObject (THAutoDestructNoti)

- (NSMutableDictionary *)thDestructNotiDictionary {
    NSMutableDictionary *dict = (NSMutableDictionary *)objc_getAssociatedObject(self, kTHAutoDestructNotiKey);
    
    if (!dict) {
        dict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, kTHAutoDestructNotiKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (void)th_destructNotiSetName:(NSString *)name block:(THDestructNotiBlock)block {
    [self th_destructNotiSetName:name userInfo:nil block:block];
}

- (void)th_destructNotiSetName:(NSString *)name userInfo:(NSDictionary *)userInfo block:(THDestructNotiBlock)block {
    [self th_destructNotiRemoveWithName:name];
    
    THDestructNoti *noti = [[THDestructNoti alloc] init];
    
    noti.name = name;
    noti.block = block;
    noti.userInfo = userInfo;
    [self.thDestructNotiDictionary setObject:noti forKey:name];
}

- (void)th_destructNotiRemoveWithName:(NSString *)name {
    NSMutableDictionary *dict = self.thDestructNotiDictionary;
    
    THDestructNoti *noti = [dict objectForKey:name];
    
    if (noti) {
        noti.block = nil;
        noti.userInfo = nil;
        [dict removeObjectForKey:name];
        noti = nil;
    }
}

@end

