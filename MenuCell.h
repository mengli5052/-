//
//  MenuCell.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/7/1.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuDetailModel.h"
@interface MenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
-(void)showDataWithModel:(MenuDetailModel*)model;
@end
