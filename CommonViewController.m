//
//  CommonViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "CommonViewController.h"
#import "LZXHelper.h"
#import "Define.h"
@interface CommonViewController ()

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title=@"家常菜";
    [self downloadDataWithUrl:kCommonUrl];
}
-(void)btnClick:(UIButton*)button{
   
    if ([LZXHelper loadMore:self.arr]) {
        [self downloadSecondData:kCommonUrl ids:[LZXHelper loadMore:self.arr]];

    }else{
        [button setTitle:@"没有更多了" forState:UIControlStateNormal];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
