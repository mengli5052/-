//
//  MenuHeaderView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/30.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^JumpDetailBlock)(NSString *cid) ;
@interface MenuHeaderView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    NSMutableArray *_dailyMenuPoList;
    UIPageControl *_pageControl;
    JumpDetailBlock _detail;
    NSMutableArray *_idArr;
}
-(void)parseData;
-(void)showData;
-(void)setJumpDetailBlock:(JumpDetailBlock)block;
-(JumpDetailBlock)block;
@end
