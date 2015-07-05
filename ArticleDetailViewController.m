                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                //
//  ArticleDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "ArticleModel.h"
#import "AFNetworking.h"
#import "ArticalCell.h"
#import "MenuDetailViewController.h"
#import "ArticalOneCell.h"
#import "LZXHelper.h"
#import "ArticalDetailHeaderView.h"
#import "AuthorDetailViewController.h"
#import "UMSocial.h"
#import "DataCenter.h"
#import "UIImageView+ImageViewEventBlock.h"
#import "Define.h"
@interface ArticleDetailViewController ()<UMSocialUIDelegate,UITextFieldDelegate,UIAlertViewDelegate,UIActionSheetDelegate>
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
    MenuDetailViewController *_menu;
    NSArray *_nameArr;
    NSMutableArray *_dataHeaderArr;
    CGRect rect;
    BOOL isCollected;
}
@end

@implementation ArticleDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    isCollected=1;
   self.navigationItem.backBarButtonItem.title=@"返回";
    [self downloadHeaderData];
    [self downDataWithUrl];
    [self createToolBar];
   
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.toolbar.hidden=NO;
}
-(void)setChangeTotalValueBlock:(ChangeTotalValueBlock)myBlock{
    _block=myBlock;
}
-(ChangeTotalValueBlock)myBlock{
    return _block;
}
#pragma mark -download Data for HeaderView and create header view
-(void)downloadHeaderData {
    _dataHeaderArr=[[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *url=[NSString stringWithFormat:kLatesAtticleDetailtUrl,self.mid];
    NSLog(@"%@",url);
    self.heaerUrl=url;
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        if (responseObject) {
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            LatestModel *model=[[LatestModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataHeaderArr addObject:model];
            [self creatHeaderView:_dataHeaderArr];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"下载失败");
    }];
    
}

-(void)creatHeaderView:(NSMutableArray*)arr{
   
   __weak typeof(self)weakSelf=self;
    
    ArticalDetailHeaderView*view=[[[NSBundle mainBundle]loadNibNamed:@"ArticalDetailHeaderView" owner:nil options:nil]lastObject];
    
 
    __weak ArticalDetailHeaderView *weakView = view;
    view.saveModel=^(LatestModel*model,NSString*weibo){
        weakSelf.latestModel=model;
        weakSelf.weibo=weibo;
       };
    view.block = ^(CGRect frame){
        weakView.frame = frame;
        [self.tableView beginUpdates];
        [self.tableView setTableHeaderView:weakView];
        [self.tableView endUpdates];
    };

    [view showDataWithArr:_dataHeaderArr];
   [view setJumpNext:^(NSMutableArray *dataArr) {
        if (self.uid!=nil) {
            AuthorDetailViewController *author=[[AuthorDetailViewController alloc]init];
            author.frienduid=self.uid;
            author.hidesBottomBarWhenPushed=YES;
            [weakSelf.navigationController pushViewController:author animated:YES];
        }
    }];
        self.tableView.tableHeaderView=view;
    self.latestModel=view.model;
}
#pragma mark - the function of toolbar(share and cellection)
-(void)createToolBar{

  [self.navigationController setToolbarHidden:NO animated:YES];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    self.navigationController.toolbar.backgroundColor=[UIColor blackColor];
    UIBarButtonItem *flex=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(flexClick)];
    [arr addObject:flex];
   
    //558d15bd67e58eabb600049e
    UIBarButtonItem *share=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Bottom_Forward" ] style:UIBarButtonItemStylePlain target:self action:@selector(shareClick:)];
    [arr addObject:share];
    [arr addObject:flex];
  
    UIBarButtonItem *forward=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Bottom_Love"] style:UIBarButtonItemStylePlain target:self action:@selector(forwardClick:)];
    [arr addObject:forward];
    [arr addObject:flex];
    self.toolbarItems=arr;
    
}
-(void)shareClick:(UIBarButtonItem*)item{
  
   _nameArr=@[UMShareToQQ,UMShareToQzone,UMShareToSina,UMShareToTencent,UMShareToWechatFavorite];
    UIActionSheet * editActionSheet = [[UIActionSheet alloc] initWithTitle:@"直接分享到微博" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    for (NSString *snsName in _nameArr) {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:snsName];
        [editActionSheet addButtonWithTitle:snsPlatform.displayName];
    }
    [editActionSheet addButtonWithTitle:@"取消"];
    editActionSheet.tag = 101;
    editActionSheet.cancelButtonIndex = editActionSheet.numberOfButtons - 1;
    [editActionSheet showFromToolbar:self.navigationController.toolbar];
    editActionSheet.delegate = self;

    
    }

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex + 1 >= actionSheet.numberOfButtons ) {
        return;
    }
 
    NSString *title=self.latestModel.title;
  
    NSString *shareText = [NSString stringWithFormat:self.heaerUrl,self.weibo];
    NSString *snsName = [_nameArr objectAtIndex:buttonIndex];
  
    
    for (NSString *name in _nameArr) {
        if ([snsName isEqualToString:name]) {
            [UMSocialData defaultData].extConfig.title=title;
            
            [UMSocialData defaultData].extConfig.smsData.shareText=shareText;
             
            UMSocialUrlResource *urlResource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:
                                                [NSString stringWithFormat:kImageUrl,self.model.imageid]];
            [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[name] content:shareText image:nil location:nil urlResource:urlResource presentedController:self completion:^(UMSocialResponseEntity *shareResponse){
                if (shareResponse.responseCode == UMSResponseCodeSuccess) {
                    //[self showAlertViewSuccess:YES title:@"恭喜" message:@"分享成功"];
                }else{
                    //[self showAlertViewSuccess:NO title:@"抱歉" message:@"分享失败"];
                }
            }];

    }
}

      UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:snsName];
    snsPlatform.bigImageName=@"share";
   
    snsPlatform.snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

-(void)showAlertViewSuccess:(BOOL)success title:(NSString*)title message:(NSString*)message{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [alert show];
    [self performSelector:@selector(dimissAlert:) withObject:alert afterDelay:3];
}
- (void)dimissAlert:(UIAlertView *)alert {
    
    if(alert){
        [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
    }
    
}
-(void)forwardClick:(UIBarButtonItem*)item{
   
    NSArray *arr=[[NSArray alloc]initWithContentsOfFile:[self getFilePath]];
   
    NSMutableArray *saveArr=[NSMutableArray arrayWithArray:arr];
   
    NSString *key=self.mid;
    if (arr.count==0) {
        [self writeToFilePathWithSaveArr:saveArr];
    }else{
    for (NSDictionary *dict in arr ) {
       
        if (![key isEqualToString:dict[@"mid"]]) {
            isCollected=0;
            [self showAlertViewSuccess:YES title:@"恭喜" message:@"收藏成功"];
            
        }else{
            isCollected=1;
             [self showAlertViewSuccess:NO title:@"抱歉" message:@"已收藏!"];
           // break;
        }
     }
    }
    if (isCollected==NO) {
        [self writeToFilePathWithSaveArr:saveArr];
    }
   [item setImage:[UIImage imageNamed:@"Icon_Bottom_Loved"]];
 
 
    BOOL isLike = [[NSUserDefaults standardUserDefaults] boolForKey:key];
   if (isLike) {
        
        return;
   }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
    //同步到磁盘
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (self.myBlock) {
        self.myBlock(self.total);
    }
    
    
}
-(void)writeToFilePathWithSaveArr:(NSMutableArray*)saveArr{
    NSDictionary *dict=@{@"author":self.model.author,@"displaytime":self.model.displaytime,@"title":self.model.title,@"imageid":self.model.imageid,@"mid":self.mid};
    
    [saveArr addObject:dict];
    [saveArr writeToFile:[self getFilePath] atomically:YES];
}
-(NSString*)getFilePath{
 return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"CollectionList.plist"];
}

#pragma mark - 处理收键盘
//点击return 收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(void)flexClick{

}
#pragma mark - downloadData
-(void)downDataWithUrl{
    __weak typeof(self) weakSelf=self;
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *url=[NSString stringWithFormat:kArticalUrl1,self.mid];
    NSLog(@"%@",url);
    self.shareurl=url;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
      
        if (responseObject) {
          NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *listArr=dict[@"list"];
            NSLog(@"%ld",listArr.count);
            if (listArr.count!=0) {
                for (NSDictionary *modelDict in listArr) {
                    ArticleModel *model=[[ArticleModel alloc]init];
                    [model setValuesForKeysWithDictionary:modelDict];
                    self.uid=model.uid;
                    self.total=model.total;
                    [_dataArr addObject:model];
                }
                [_menu setMyBlock:^(NSString *imageId) {
                    weakSelf.imageId=imageId;
                }];

            }
            
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        NSLog(@"网络下载失败:%@",error.description);
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleModel *model=_dataArr[indexPath.row];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        if ([model.musername isEqualToString:self.musername]) {
            
            ArticalCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticalCell"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"ArticalCell" owner:nil options:nil]lastObject] ;
            }
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            [cell.nextImage addClickEvent:^(UIImageView *imageView) {
                MenuDetailViewController *menu=[[MenuDetailViewController alloc]init];
                menu.cid=model.caipuid;
                UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
                item.title=@"返回";
                menu.navigationItem.backBarButtonItem=item;
                menu.navigationItem.title=@"菜谱详情";
                [self.navigationController pushViewController:menu animated:YES];
            }];
            [cell showDataWithModel:model];
            return cell;
            
        } else {
            ArticalOneCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticalOneCell"];
            
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"ArticalOneCell" owner:nil options:nil]lastObject] ;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell displayDataWithModel:model];
            return cell;
        }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleModel *model=_dataArr[indexPath.row];
    if ([model.musername isEqualToString:self.musername]) {
        return [ArticalCell heightOfModel:model];
    }
    else {
        return [ArticalOneCell heightOfModel:model];
     }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
