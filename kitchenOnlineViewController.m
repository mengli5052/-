//
//  kitchenOnlineViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "kitchenOnlineViewController.h"
#import "BaseViewController.h"
#import "MyControl.h"

#import "CollectionViewController.h"
@interface kitchenOnlineViewController ()

@end

@implementation kitchenOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContrallers];
    [self creatLaunchImageAnimation];
}
- (void)creatLaunchImageAnimation {
    //增加一个 程序加载时候的启动动画。下面使我们自己实现的一个 隐藏的动画效果
    UIImageView * startView = [MyControl creatImageViewWithFrame:self.view.bounds imageName:[NSString stringWithFormat:@"Default%u",arc4random()%5+1]];
    [self.view addSubview:startView];
    [UIView animateWithDuration:4 animations:^{
        startView.alpha = 0;
    } completion:^(BOOL finished) {
        [startView removeFromSuperview];
    }];
    
}
-(void)createContrallers{
    NSMutableArray *vcArr=[NSMutableArray array];
   
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Controllers" ofType:@"plist"];
    NSArray *infoArr=[NSArray arrayWithContentsOfFile:path];
    for (NSInteger i=0; i<infoArr.count; i++) {
        Class vcClass=NSClassFromString(infoArr[i][@"vcName"]);
       BaseViewController *vc=[[vcClass alloc]init];
        vc.title=infoArr[i][@"title"];
       [vc.navigationController.navigationBar setBackgroundImage: [UIImage imageNamed: @"title_bg"] forBarMetrics:UIBarMetricsDefault];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        
       
        nav.tabBarItem.image=[UIImage imageNamed: infoArr[i][@"imageName"]];
       
        [vcArr addObject:nav];
    }
//    CollectionViewController *collection=[[CollectionViewController alloc]init];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:collection];
//    collection.tabBarItem.image=[UIImage imageNamed: @"Icon_setting"];
//    collection.title=@"收藏";
//    [vcArr addObject:nav];
//    
    self.viewControllers=vcArr;
    [self.tabBar setBackgroundImage:[UIImage imageNamed: @"tabbarbg"]];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
