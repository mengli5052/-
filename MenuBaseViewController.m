//
//  MenuBaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/22.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuBaseViewController.h"
#import "MenuCell.h"
#import "LZXHelper.h"
#import "Define.h"
@interface MenuBaseViewController ()

@end

@implementation MenuBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem.title=@"返回";
    number=0;
    self.tableView.rowHeight=107;
    self.arr=[[NSArray alloc]init];
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer  serializer];
    [self creatPullUpView];
}
#pragma mark -点击加载
- (void)creatPullUpView {
    UIButton *pull = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 50)];
    [pull setTitle:@"点击加载更多" forState:UIControlStateNormal];
    pull.titleLabel.textAlignment = NSTextAlignmentCenter;
    pull.backgroundColor = [UIColor blackColor];
    [pull addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = pull;
}
-(void)btnClick:(UIButton*)button{
    
}

#pragma mark -下载数据
-(void)downloadDataWithUrl:(NSString *)url{
    
[_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *listArr=dict[@"list"];
        self.arr=listArr;
        NSString *str=nil;
        str=[LZXHelper loadMore:listArr];
        [self downloadSecondData:url ids:str];
    
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败:%@",error.description);
    }];
}
-(void)downloadSecondData:(NSString*)url ids:(NSString*)str{
    NSString *combinedUrl=nil;
    if ([url isEqualToString:kCommonUrl]) {
        combinedUrl=[[NSString stringWithFormat:kCommonUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
       
    }else if ([url isEqualToString:kTheLatestUrl]){
        combinedUrl=[[NSString stringWithFormat:kTheLatestUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
       
    }else{
        combinedUrl=[[NSString stringWithFormat:kRecentPopularUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }

    AFHTTPRequestOperationManager *manager1=[AFHTTPRequestOperationManager manager];
    manager1.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager1  GET:combinedUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSDictionary *dict1=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *listArr1=dict1[@"list"];
        
        for (NSDictionary *modelDict in listArr1) {
            MenuDetailModel *model=[[MenuDetailModel alloc]init];
            [model setValuesForKeysWithDictionary:modelDict];
            [_dataArr addObject:model];
        }
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败:%@",error.description);
    }];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
       return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MenuCell" owner:nil options:nil]lastObject];
    }
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    MenuDetailModel *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuDetailModel *model=_dataArr[indexPath.row];
    MenuDetailViewController *menu=[[MenuDetailViewController alloc]init];
    menu.cid=model.id;
    [self.navigationController pushViewController:menu animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


@end
