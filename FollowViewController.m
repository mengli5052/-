//
//  FollowViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "FollowViewController.h"
#import "Define.h"
@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title=@"关注的人";
    self.navigationItem.backBarButtonItem.title=@"返回";
    [self downloadDataWithUrl:kFollowUrl];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
