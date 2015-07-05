//
//  GottalentViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "GottalentViewController.h"
#import "GottalenModel.h"
#import "GottalenCell.h"
#import "AuthorDetailViewController.h"
#import "Define.h"
@interface GottalentViewController ()

@end

@implementation GottalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title=@"达人推荐";
   
    self.navigationItem.backBarButtonItem.title=@"返回";
    [self downloadDataWithUrl:kGottalentUrl];
   
}
- (void)downloadDataWithUrl:(NSString *)url{
  [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
   NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSArray *listArr=dict[@"list"];
    for (NSDictionary *modelDict in listArr) {
        GottalenModel *model=[[GottalenModel alloc]init];
        [model setValuesForKeysWithDictionary:modelDict];
                [_dataArr addObject:model];
    }
    [self.tableView reloadData];
    
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"下载失败");
}];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GottalenCell *cell=[tableView dequeueReusableCellWithIdentifier:@"GottalenCell"];
          if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"GottalenCell" owner:nil options:nil]lastObject];
    }
    GottalenModel *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GottalenModel *model=_dataArr[indexPath.row];
    AuthorDetailViewController *author=[[AuthorDetailViewController alloc]init];
    author.frienduid=model.id;
   
    [self.navigationController pushViewController:author animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
