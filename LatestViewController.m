//
//  LatestViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/13.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestViewController.h"
#import "Define.h"
@interface LatestViewController ()

@end

@implementation LatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title=@"最新";
       self.navigationItem.backBarButtonItem.title=@"返回";
    [self downloadDataWithUrl:kLatestUrl];
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
