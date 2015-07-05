//
//  MainViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"
#import "Model.h"
#import "RecommendCell.h"
#import "MyControl.h"
#import "dailyMenuModel.h"
#import "LZXHelper.h"
#import "ArticleDetailViewController.h"
#import "MMProgressHUD.h"
#import "LZXHelper.h"
#import "Define.h"
#import "ADView.h"

@interface MainViewController ()
{
    NSMutableArray *_dailyMenuPoList;
    NSMutableArray *_onTop;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstInit];
    _dailyMenuPoList=[[NSMutableArray alloc]init];
    _onTop=[[NSMutableArray alloc]init];
    self.tableView.rowHeight=100;
    [self downDataWithUrl];
    self.tableView.tableHeaderView.frame=CGRectMake(0, 0, kScreenSize.width, 275);
    
  
}

- (void)viewWillAppear:(BOOL)animated {
     [self.navigationController setToolbarHidden:YES animated:NO];
    self.navigationController.toolbar.hidden = YES;
}



-(void)downDataWithUrl{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //设置状态
    [MMProgressHUD showWithTitle:@"数据下载" status:@"loading...."];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:[LZXHelper getFullPathWithMyCacheFile:kFirstUrl]];
    //检测文件是否超时 允许超时 1小时
    BOOL isTimeOut = [LZXHelper isTimeOutFile:kFirstUrl time:60*60];
    
    if (isExist == YES&&isTimeOut == NO) {
        //走本地缓存
        NSData *data = [NSData dataWithContentsOfFile:[LZXHelper getFullPathWithMyCacheFile:kFirstUrl]];
        //data 就是一个之前保存的json数据
        //解析
        //解析json
        NSDictionary *recommend=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [_dataArr removeAllObjects];
        [_onTop removeAllObjects];
        [_dailyMenuPoList removeAllObjects];
        NSArray *recommendArr=recommend[@"recommendUris"];
        NSArray *daily=recommend[@"dailyMenuPoList"];
        NSArray *onTop=recommend[@"ontop"];
        for (NSDictionary *dict in onTop) {
            NSString *imageurl=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
            [_onTop addObject:imageurl];
        }
        ADView *view=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 270) imageUrl:_onTop];
        self.tableView.tableHeaderView=view;
        [self.tableView reloadData];
        for (NSDictionary *dict in daily) {
            dailyMenuModel *model=[[dailyMenuModel alloc]init];
            model.type=dict[@"type"];
            model.imageid=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
            model.id=dict[@"id"];
            model.name=dict[@"name"];
            [_dailyMenuPoList addObject:model];
        }
        
        for (NSDictionary *dict in recommendArr) {
            Model *model=[[Model alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
        }
        [self.tableView reloadData];
       [MMProgressHUD dismissWithSuccess:@"恭喜你" title:@"本地下载成功"];
        
        return;//返回 不走网络了
    }
    
    [_manager GET:kFirstUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
      
        if (responseObject) {
            [_dataArr removeAllObjects];
            NSData *data=(NSData*)responseObject;
            NSString *filePath=[LZXHelper getFullPathWithMyCacheFile:kFirstUrl];
            [data writeToFile:filePath atomically:YES];
            NSDictionary *recommend=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *recommendArr=recommend[@"recommendUris"];
            NSArray *daily=recommend[@"dailyMenuPoList"];
            NSArray *onTop=recommend[@"ontop"];
           for (NSDictionary *dict in onTop) {
             NSString *imageurl=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
              [_onTop addObject:imageurl];
           }
            ADView *view=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 250) imageUrl:_onTop];
            self.tableView.tableHeaderView=view;
            [self.tableView reloadData];
            for (NSDictionary *dict in daily) {
                dailyMenuModel *model=[[dailyMenuModel alloc]init];
                model.type=dict[@"type"];
                model.imageid=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
                  model.id=dict[@"id"];
                model.name=dict[@"name"];
                [_dailyMenuPoList addObject:model];
            }
            
            for (NSDictionary *dict in recommendArr) {
                Model *model=[[Model alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [_dataArr addObject:model];
            }
            [self.tableView reloadData];
            
        }
         [MMProgressHUD dismissWithSuccess:@"恭喜你" title:@"下载成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        NSLog(@"网络下载失败;%@", error.description);
         [MMProgressHUD dismissWithError:@"下载失败" title:@"警告"];
    }];
    
}
-(void)createHeaderView:(NSArray *)imageUrl{
   ADView *view=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 60) imageUrl:imageUrl];
    self.tableView.tableHeaderView=view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RecommendCell" owner:nil options:nil]lastObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    Model *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   ArticleDetailViewController *article=[[ArticleDetailViewController alloc]init];
    Model *model=_dataArr[indexPath.row];
    NSArray *arr=[model.uri componentsSeparatedByString:@"?"];
    NSArray *arr2=[arr[1] componentsSeparatedByString:@"="];
    NSString *uid=[arr2 lastObject];
    NSLog(@"uid:%@",uid);
    NSLog(@"%@",model.author);
    
    article.mid=uid;
    
    article.model=model;
 
    article.navigationItem.title=@"全部";
    article.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:article animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
