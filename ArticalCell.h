//
//  ArticalCell.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"
typedef void(^JumpNext) (UIImageView *nextImage);
@interface ArticalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *nextImage;
@property(nonatomic,copy)JumpNext next;

+(CGFloat)heightOfModel:(ArticleModel*)model;
-(void)showDataWithModel:(ArticleModel*)model;
@end
