//
//  MenuHeaderView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/30.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuHeaderView.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
#import "UIImageView+ImageViewEventBlock.h"
#import "MenuDetailViewController.h"
#import "Define.h"
@implementation MenuHeaderView
-(void)setJumpDetailBlock:(JumpDetailBlock)block{
    _detail=block;
}
-(JumpDetailBlock)block{
    return _detail;
}
-(void)parseData{
    _idArr=[[NSMutableArray alloc]init];
    _dailyMenuPoList=[[NSMutableArray alloc]init];
    NSData *data = [NSData dataWithContentsOfFile:[LZXHelper getFullPathWithMyCacheFile:kFirstUrl]];
    //data 就是一个之前保存的json数据
    //解析
    //解析json
    NSDictionary *recommend=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *daily=recommend[@"dailyMenuPoList"];
    
    for (NSDictionary *dict in daily) {
        NSString *imageUrl=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
        NSString *cid=dict[@"recipeid"];
        [_idArr addObject:cid];
        [_dailyMenuPoList addObject:imageUrl];
    }
}
- (void)showData{
    
   _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, (1/4.0*kScreenSize.height)-30)];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"MainScrollView" ofType:@"plist"];
    NSArray *arr=[[NSArray alloc]initWithContentsOfFile:path];
   for (NSInteger i=0; i<arr.count; i++) {
        NSDictionary *dict=arr[i];
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(4+(9+kScreenSize.width-10)*i, 0, kScreenSize.width-10,1/4.0*kScreenSize.height-20 )];
      
        UIImageView *iconImage=[[UIImageView alloc]initWithFrame:CGRectMake(view.bounds.origin.x+10, 10, 22, 22)];
       
        iconImage.image=[UIImage imageNamed:dict[@"iconImage"]];
        [view addSubview:iconImage];
        UILabel *timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconImage.frame)+5, 10, 80, 22)];
        UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLabel.frame)+5, 15, kScreenSize.width-150, 22)];
        contentLabel.font=[UIFont systemFontOfSize:12];
        timeLabel.text=dict[@"timeLabel"];
        contentLabel.text=dict[@"contentLabel"];
        for (NSInteger j=0; j<4; j++) {
            CGFloat spcing=3;
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(3+(spcing+(kScreenSize.width-11-spcing*4)/4)*j, CGRectGetMaxY(iconImage.frame)+5, (kScreenSize.width-6-spcing*4)/4, 1/4.0*kScreenSize.height-70)];
                        [imageView sd_setImageWithURL:[NSURL URLWithString:_dailyMenuPoList[i*4+j]] placeholderImage:[UIImage imageNamed: @"background12"]];
        [imageView addClickEvent:^(UIImageView *imageView) {
            if (self.block) {
                self.block(_idArr[i*4+j]);
            }
            
        }];
            [view addSubview:imageView];
                    }
        [view addSubview:timeLabel];
        [view addSubview:contentLabel];
        [_scrollView addSubview:view];
    }
   
    _scrollView.contentSize=CGSizeMake(kScreenSize.width*3, 1/4.0*kScreenSize.height-20);
    
    _scrollView.showsVerticalScrollIndicator = NO;
    //按页
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self createPageControl:arr];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(_pageControl.frame), kScreenSize.width-10, 3)];
    view.backgroundColor=[UIColor purpleColor];
    [self addSubview:_scrollView];
    [self addSubview:view];
    //页码器
    
}
-(void)createPageControl:(NSArray *)arr{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenSize.width-210, 1/4.0*kScreenSize.height-20, kScreenSize.width, 30)];
    _pageControl.numberOfPages = arr.count;
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
