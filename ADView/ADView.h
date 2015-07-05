//
//  ADView.h
//  UITableView_Cell定制
//
//  Created by LZXuan on 14-12-18.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenSize [UIScreen mainScreen].bounds.size
//广告位 视图  按页显示
@interface ADView : UIView <UIScrollViewDelegate>
- (id)initWithFrame:(CGRect)frame  imageUrl:(NSArray*)imageUrl;
@end
