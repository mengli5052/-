//
//  UIImageView+ImageViewEventBlock.h
//  自定义控件
//
//  Created by LZXuan on 15-6-2.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义一个block
typedef void(^ImageViewBlock) (UIImageView *imageView);
@interface UIImageView (ImageViewEventBlock)
//给UIImageView增加一个点击事件 传入一个block
- (void)addClickEvent:(ImageViewBlock)block;
@end
