//
//  BaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "BaseViewController.h"
#import "LatestModel.h"
#import "LatestCell.h"
#import "MMProgressHUD.h"
#import "SettingViewController.h"
#import "UIImageView+WebCache.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addItemWithTitle];
}
-(void)firstInit{
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
}
-(void)addItemWithTitle{
 self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Mine_ClearCache"] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIImageView *titleV=[[UIImageView alloc]initWithImage:[UIImage imageNamed: @"Title_eCook"]];
    self.navigationItem.titleView=titleV;
  
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"返回";
    self.navigationItem.backBarButtonItem=backItem;
    
}


-(void)downDataWithUrl:(NSString*)url{
    NSString *urlString=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"网络下载失败");
        }];
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
-(void)mineClick{
    //把权限交给Navigation
    SettingViewController *setting=[[SettingViewController alloc]init];
    [setting  setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:setting animated:YES];
    //[self clearCache];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//-(void)clearCache{
//    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"clear memory" message:[NSString stringWithFormat:@"总共有%.5fM缓存",[self getCacheSize]] preferredStyle:UIAlertControllerStyleActionSheet];
//    // alert addAction:[UIAlertAction ]
//    [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//        [[SDImageCache sharedImageCache]clearMemory];//清除缓存;
//        [[SDImageCache sharedImageCache]clearDisk];//清除磁盘的缓存;
//        NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
//        [[NSFileManager defaultManager]removeItemAtPath:myCachePath error:nil];
//    }]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        
//    }]];
//    [self presentViewController:alert animated:YES completion:nil];
//    
//    
//}
//-(CGFloat)getCacheSize{
//    //爱限免有两部分缓存,
//    NSInteger imageCacheSize=[[SDImageCache sharedImageCache]getSize];
//    //获取自定义文件大小;
//    //1.先获取枚举器;
//    NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
//    NSDirectoryEnumerator *enumerator=[[NSFileManager defaultManager]enumeratorAtPath:myCachePath];
//    //2.遍历;
//    __block NSInteger count=0;
//    for (NSString *fileName in enumerator) {
//        NSString *filePath=[myCachePath stringByAppendingPathComponent:fileName];
//        NSDictionary *fileDict=[[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil];
//        count+=fileDict.fileSize;
//    }
//    
//    CGFloat size=((CGFloat)(imageCacheSize+count))/1024/1024;
//    return size;
//
//
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

       return _dataArr.count;
}


@end
