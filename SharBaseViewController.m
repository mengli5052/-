//
//  SharBaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "SharBaseViewController.h"
#import "ArticleDetailViewController.h"

@interface SharBaseViewController ()

@end

@implementation SharBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.tableView.rowHeight=120;
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer  serializer];
  
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.toolbar.hidden=YES;
}
-(void)downloadDataWithUrl:(NSString*)url{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //设置状态
    [MMProgressHUD showWithTitle:@"数据下载" status:@"loading...."];
    NSString *urlString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   
    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        if (responseObject) {
            
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *listArr=dict[@"list"];
           for (NSDictionary *dict in listArr) {
                LatestModel *model=[[LatestModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
               
                [_dataArr addObject:model];
                
            }
           
            [self.tableView reloadData];
        }
          [MMProgressHUD dismissWithSuccess:@"恭喜你" title:@"网络下载成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
         [MMProgressHUD dismissWithError:@"下载失败" title:@"警告"];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LatestCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LatestCell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"LatestCell" owner:nil options:nil]lastObject];
    }
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    LatestModel *model=_dataArr[indexPath.row];
    
    [cell showDataWithModel:model];
      
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LatestModel *model=_dataArr[indexPath.row];
    ArticleDetailViewController *article=[[ArticleDetailViewController alloc]init];
      article.mid=model.id;
 
    article.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:article animated:YES];
    self.navigationController.toolbar.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
