//
//  CollectionViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/27.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyControl.h"
#import "RecommendCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@interface CollectionViewController ()
//<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
    UITableView *_tableView;
}
@property(nonatomic)UITableView *tableView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"收藏";
   //[self cr]
    [self createHeaderView];
    [self  createTable:64];
     [self addClaerCollection];
    self.tableView.rowHeight=120;
    
   _dataArr=[[NSMutableArray alloc]initWithContentsOfFile:[self getFilePath]];
    
    [self.tableView reloadData];
 
 
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
-(NSString *)getFilePath{
return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"CollectionList.plist"];
    
}
-(void)createHeaderView{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 140)];
    imageView.image=[UIImage imageNamed: @"background12"];
    self.tableView.tableHeaderView=imageView;
}
-(void)addClaerCollection{
    UIBarButtonItem *clearCollection=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(clearCollection:)];
    clearCollection.title=@"清除收藏";
    self.navigationItem.rightBarButtonItem=clearCollection;
}
-(void)clearCollection:(UIBarButtonItem*)item{

     [_dataArr removeAllObjects] ;

    [_dataArr writeToFile:[self getFilePath] atomically:YES];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RecommendCell" owner:nil options:nil]lastObject];
    }
    NSDictionary *dict=_dataArr[indexPath.row];
  
    cell.author.text=dict[@"author"];
    cell.title.text=dict[@"title"];
    cell.time.text=dict[@"displaytime"];
    [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,dict[@"imageid"]]] placeholderImage:[UIImage imageNamed: @"qzone"]];
    return cell;
}
@end
