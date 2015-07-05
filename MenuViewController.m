//
//  MenuViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuViewController.h"
#import "RecentlyPopularViewController.h"
#import "TheLatestViewController.h"
#import "CommonViewController.h"
#import "MenuHeaderView.h"
#import "GottalenCell.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
@interface MenuViewController ()
{
    NSArray *_titles;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addItemWithTitle];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"MenuList" ofType:@"plist"];
    _titles=[NSArray arrayWithContentsOfFile:path];
  
    [self createHeaderView];
    self.tableView.rowHeight=100;
}
-(void)addItemWithTitle{
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.backgroundColor=[UIColor orangeColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Mine_ClearCache"] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIImageView *titleV=[[UIImageView alloc]initWithImage:[UIImage imageNamed: @"Title_eCook"]];
    self.navigationItem.titleView=titleV;
    
    
}
-(void)mineClick{
    //把权限交给Navigation
    //    SettingViewController *setting=[[SettingViewController alloc]init];
    //    [setting  setHidesBottomBarWhenPushed:YES];
    //    [self.navigationController pushViewController:setting animated:YES];
    [self clearCache];
}
-(void)clearCache{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"clear memory" message:[NSString stringWithFormat:@"总共有%.5fM缓存",[self getCacheSize]] preferredStyle:UIAlertControllerStyleActionSheet];
    // alert addAction:[UIAlertAction ]
    [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [[SDImageCache sharedImageCache]clearMemory];//清除缓存;
        [[SDImageCache sharedImageCache]clearDisk];//清除磁盘的缓存;
        NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
        [[NSFileManager defaultManager]removeItemAtPath:myCachePath error:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
-(CGFloat)getCacheSize{
    //爱限免有两部分缓存,
    NSInteger imageCacheSize=[[SDImageCache sharedImageCache]getSize];
    //获取自定义文件大小;
    //1.先获取枚举器;
    NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
    NSDirectoryEnumerator *enumerator=[[NSFileManager defaultManager]enumeratorAtPath:myCachePath];
    //2.遍历;
    __block NSInteger count=0;
    for (NSString *fileName in enumerator) {
        NSString *filePath=[myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict=[[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil];
        count+=fileDict.fileSize;
    }
    
    CGFloat size=((CGFloat)(imageCacheSize+count))/1024/1024;
    return size;
    
    
}
-(void)createHeaderView{
    MenuHeaderView *view=[[MenuHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 1/3.0*kScreenSize.height+10)];
    [view parseData];
    [view setJumpDetailBlock:^(NSString *cid) {
        MenuDetailViewController *detail=[[MenuDetailViewController alloc]init];
        detail.cid=cid;
        [self.navigationController pushViewController:detail animated:YES];
        
    }];
    
    
    [view showData];
    self.tableView.tableHeaderView=view;
}
-(void)deliver:(UIBarButtonItem*)button{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSDictionary *dict=_titles[indexPath.row];
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.imageView.image=[UIImage imageNamed:dict[@"bigImage"]];
    cell.textLabel.text=dict[@"title"];
    cell.detailTextLabel.text=dict[@"detailTitle"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        RecentlyPopularViewController *recent=[[RecentlyPopularViewController alloc]init];
        recent.navigationItem.title=@"最近流行";
       recent.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:recent animated:YES];
    }else if (indexPath.row==1){
        TheLatestViewController *latest=[[TheLatestViewController alloc]init];
        latest.hidesBottomBarWhenPushed=YES;
        latest.navigationItem.title=@"最新菜谱";
        [self.navigationController pushViewController:latest animated:YES];
    }else{
        CommonViewController *common=[[CommonViewController alloc]init];
        common.hidesBottomBarWhenPushed=YES;
        common.navigationItem.title=@"大家都在做";
        [self.navigationController pushViewController:common animated:YES];
    }
}

@end
