//
//  Essence postViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/13.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "Essence postViewController.h"
#import "Define.h"
@interface Essence_postViewController ()

@end

@implementation Essence_postViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title=@"精华帖";
    [self downloadDataWithUrl:kEssencepostUrl];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
