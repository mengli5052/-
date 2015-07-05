//
//  BaseViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"
@interface BaseViewController : UITableViewController
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
    BOOL _isrRefreshing;
    NSInteger _currentPage;
    BOOL _isLoadMoring;
}
@property(nonatomic)SEL action;
@property(nonatomic,strong)id target;
@property(nonatomic)BOOL isRefreshing;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,assign)BOOL isLoadMoring;
-(void)firstInit;
-(void)addItemWithTitle;
-(void)downDataWithUrl:(NSString*)url;
@end
