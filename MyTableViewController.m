//
//  MyTableViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/27.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyControl.h"
#import "Define.h"
#import "AFNetworking.h"
#define kMyUrl @" http://121.40.129.231/ecook/getUserInformation.shtml?machine=33b9fed4b35973eedef88fb68d619c16"
@interface MyTableViewController (){
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_myArr;
    NSArray *_pushArr;
    NSMutableDictionary *_dict;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
        [super viewDidLoad];
    self.navigationItem.title=@"设置";
       _dataArr= [[NSArray alloc] initWithObjects:@"推送设置",@"开启推送通知",@"开启关注通知",@"感谢您的支持", nil];
       [self createTable:64];
    
        self.tableView.rowHeight=80;
}

-(void)btnClick:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:cellID];
    }
    
    NSString *str = _dataArr[indexPath.row];
    cell.textLabel.text=str;
    
    if( (indexPath.row == 1 || indexPath.row == 2))
    {
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250, 5, 60, 30)];
        mySwitch.on = NO;
        mySwitch.tag = 1001+indexPath.row;
        [mySwitch addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:mySwitch];
    }
    
    
    return cell;
}

- (void)switchClick:(UISwitch *)sw {
    switch (sw.tag) {
        case 1002://推送通知
        {
            
        }
            break;
        case 1003://关注通知
        {
            
        }
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
