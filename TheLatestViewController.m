//
//  TheLatestViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "TheLatestViewController.h"
#import "Define.h"
#import "LZXHelper.h"
@interface TheLatestViewController ()

@end

@implementation TheLatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title=@"最新";
    [self downloadDataWithUrl:kTheLatestUrl];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
