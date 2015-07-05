//
//  GottalenCell.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GottalenModel.h"
#import "MenuDetailModel.h"
@interface GottalenCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImae;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
-(void)showDataWithModel:(GottalenModel*)model;
@end
