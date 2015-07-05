//
//  ADView.m
//  UITableView_Cell定制
//
//  Created by LZXuan on 14-12-18.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import "ADView.h"
#import "UIImageView+WebCache.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
@implementation ADView
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
//非arc
- (void)dealloc {
    [_scrollView release];
    [_pageControl release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame  imageUrl:(NSArray*)imageUrl
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self creatView:imageUrl];
    }
    return self;
}
- (void)creatView:(NSArray *)imageUrl {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 270)];
    
    for (int i = 0; i < imageUrl.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, 270)];
        
        [imageView sd_setImageWithURL:imageUrl[i]  placeholderImage:nil];
        [_scrollView addSubview:imageView];
        [imageView release];
    }
    //下面设置滚动视图
    _scrollView.contentSize = CGSizeMake(imageUrl.count*kScreenSize.width, 270);
    _scrollView.showsVerticalScrollIndicator = NO;
    //按页
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    [self addSubview:_scrollView];
    //页码器
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenSize.width-230, 240, kScreenSize.width, 30)];
    _pageControl.numberOfPages = imageUrl.count;
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
}
- (void)pageClick:(UIPageControl *)page {
    //修改滚动视图的偏移量
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*page.currentPage, 0) animated:YES];
}
//减速停止的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //修改页码
    CGPoint offset = _scrollView.contentOffset;
    _pageControl.currentPage = offset.x/_scrollView.bounds.size.width;
}

@end
