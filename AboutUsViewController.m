//
//  AboutUsViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/27.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "AboutUsViewController.h"
#import "MyControl.h"
#import "Define.h"
@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"关于我们";
    [self createTable:64];
    self.tableView.rowHeight=100;
  UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-400)];
    imageView.image=[UIImage imageNamed: @"background12"];
    self.tableView.tableHeaderView=imageView;
    _dataArr=[[NSArray alloc]initWithObjects:@"谢谢您的支持", nil];
}

-(void)btnClick:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.imageView.image=[UIImage imageNamed: @"dropdown_anim__0001"];
    cell.textLabel.text=_dataArr[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }



@end
