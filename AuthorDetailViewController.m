//
//  AuthorDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "AuthorDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@interface AuthorDetailViewController ()
{
    AFHTTPRequestOperationManager *_manager;
}
@end

@implementation AuthorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.title=@"个人主页";
    
    self.navigationItem.backBarButtonItem.title=@"返回";
    self.tabBarController.tabBar.hidden=YES;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed: @"background"]]];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [self showData];
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.toolbar.hidden=YES;
}

-(void)showData{
   [_manager GET:[NSString stringWithFormat:kAuthorDetailUrl,self.frienduid] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
      NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.iconImage.layer.masksToBounds=YES;
        self.iconImage.layer.cornerRadius=10;
            [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,dict[@"pic"]] ] placeholderImage:nil];
            self.author.text=dict[@"title"];
            if ([dict[@"sex"]isEqualToString:@"0"]) {
                self.sex.text=[NSString stringWithFormat:@"女  %@",dict[@"region"]];
            }else{
            self.sex.text=[NSString stringWithFormat:@"男  %@",dict[@"region"]];
            }
            self.fans.text=[NSString stringWithFormat:@"粉丝%@    关注%@",dict[@"fans"],dict[@"follow"]];
            
            [self.collectMenu setTitle:[NSString stringWithFormat:@" %@\n菜谱收藏",dict[@"collection"]] forState:UIControlStateNormal];
        self.collectMenu.userInteractionEnabled=NO;
            self.collectMenu.titleLabel.numberOfLines=0;
            [self.likes setTitle:[NSString stringWithFormat:@"  %@\nTA喜欢的",dict[@"enjoyWeibo"]] forState:UIControlStateNormal];
        self.likes.userInteractionEnabled=NO;
            self.likes.titleLabel.numberOfLines=0;
            [self.privateKitchen setTitle:[NSString stringWithFormat:@"  %@\n私房菜",dict[@"recommend"]] forState:UIControlStateNormal];
        self.privateKitchen.userInteractionEnabled=NO;
            self.privateKitchen.titleLabel.numberOfLines=0;
        self.topics.userInteractionEnabled=NO;
        if (dict[@"topic"]==nil) {
            [self.topics setTitle:[NSString stringWithFormat:@"  0\n话题"] forState:UIControlStateNormal];
        }else{
            [self.topics setTitle:[NSString stringWithFormat:@"  %@\n话题",dict[@"topic"]] forState:UIControlStateNormal];
        }
            self.topics.titleLabel.numberOfLines=0;
        self.keyWords.text=[NSString stringWithFormat:@"简介:  %@",dict[@"profile"]];
        self.keyWords.editable=NO;
       
        
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(void)viewDidDisappear:(BOOL)animated{
    self.navigationController.toolbar.hidden=NO;
}

@end
