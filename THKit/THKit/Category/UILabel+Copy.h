//
//  UILabel+Copy.h
//  THKit
//
//  Created by Terence Yang on 2022/8/16.
//

#import <UIKit/UIKit.h>


@interface UILabel (Copy)

@property(nonatomic, assign) BOOL isCopyEnabled;

@property(nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

