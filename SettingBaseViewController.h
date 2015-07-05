//
//  SettingBaseViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/27.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingBaseViewController : UIViewController
{
    UITableView *_tableView;
    NSArray *_dataArr;
}
@property(nonatomic)UITableView *tableView;
@property(nonatomic,copy)NSArray *dataArr;
-(void)createTable:(CGFloat)height;
@end
