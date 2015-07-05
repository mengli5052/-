//
//  LatestCell.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/15.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LatestModel.h"
@interface LatestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *title2Label;
@property (weak, nonatomic) IBOutlet UIButton *enjoyButton;
@property (weak, nonatomic) IBOutlet UIButton *forwordButton;


-(void)showDataWithModel:(LatestModel*)model;
@end
