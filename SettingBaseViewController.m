//
//  SettingBaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/27.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "SettingBaseViewController.h"
#import "Define.h"
#define kIdentifier @"Cell"
@interface SettingBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)createTable:(CGFloat)height{
   
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, height, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    //设置代理
   self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-400)];
    imageView.image=[UIImage imageNamed: @"background12"];
    self.tableView.tableHeaderView=imageView;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kIdentifier];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
