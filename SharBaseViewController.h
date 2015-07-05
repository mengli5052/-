//
//  SharBaseViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "LatestCell.h"
#import "LatestModel.h"
#import "AFNetworking.h"
#import "MMProgressHUD.h"
@interface SharBaseViewController : UITableViewController
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
    
}

-(void)downloadDataWithUrl:(NSString*)url;
@end
