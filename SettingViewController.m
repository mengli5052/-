//
//  SettingViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "SettingViewController.h"
#import "MyControl.h"
#import "SDImageCache.h"
#import "CollectionViewController.h"
#import "AboutUsViewController.h"
#import "LoginViewController.h"
#import "MyTableViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "Define.h"
#import "MyControl.h"
@interface SettingViewController ()
{
   }
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
   
   
 
    [self showUI];
  
    
}

-(void)showUI{
   
    UIButton *back=[MyControl creatButtonWithFrame:CGRectMake(0, 0, kScreenSize.width, 64) target:self sel:@selector(btnClick:) tag:100 image:nil  backgroundImage:nil  title:@"返回"];
    [back setBackgroundColor:[UIColor orangeColor]];
    [back setTitleEdgeInsets:UIEdgeInsetsMake(0, -230, 0, 0)];
    [self.view addSubview:back];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"SettingButton" ofType:@"plist"];
    NSArray *arr=[NSArray arrayWithContentsOfFile:filePath];
    for (NSInteger i=0; i<2; i++) {
        NSDictionary *dict=arr[i];
        UIButton *button=[MyControl creatButtonWithFrame:CGRectMake(40, 74+44*i, kScreenSize.width-80, 44) target:self sel:@selector(btnClick:) tag:101+i image:dict[@"icon"] backgroundImage:nil title:dict[@"title"]];
        [button setBackgroundImage:[UIImage imageNamed: @"Background_Share"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    for (NSInteger i=2; i<arr.count; i++) {
        NSDictionary *dict=arr[i];
        UIButton *button1=[MyControl creatButtonWithFrame:CGRectMake(40, 182+44*(i-2), kScreenSize.width-40*2, 44) target:self sel:@selector(btnClick:) tag:101+i image:dict[@"icon"] backgroundImage:nil  title:dict[@"title"]];
        [button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button1 setBackgroundImage:[UIImage imageNamed: @"Background_Share"] forState:UIControlStateNormal];
        [self.view addSubview:button1];
        
    }
}
-(void)btnClick:(UIButton*)button{
    switch (button.tag) {
        case 100://返回
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 101://登陆
        {
            LoginViewController *login=[[LoginViewController alloc]init];
            [self.navigationController pushViewController:login animated:YES];

        }
            break;
        case 102://注册
        {
            RegisterViewController *registerview=[[RegisterViewController alloc]init];
            [self.navigationController pushViewController:registerview animated:YES];
        }
            break;
        case 103://我的
        {
            MyTableViewController *my=[[MyTableViewController alloc]init];
            [self.navigationController pushViewController:my animated:YES];
        }
            break;
        case 104://收藏夹
        {
            CollectionViewController *collection=[[CollectionViewController alloc]init];
            [self.navigationController pushViewController:collection animated:YES];
            
        }
            break;
        case 105://清除缓存
        {
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
            break;
        case 106://关于我们
        {
            AboutUsViewController *us=[[AboutUsViewController alloc]init];
          
            [self.navigationController pushViewController:us animated:YES];
        }
            break;
        default:
            break;
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
