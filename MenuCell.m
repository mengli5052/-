//
//  MenuCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/7/1.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuCell.h"
#import "Define.h"
#import "UIImageView+WebCache.h"
@implementation MenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)showDataWithModel:(MenuDetailModel*)model{
    self.title.text=model.name;
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:[UIImage imageNamed: @"background12"]];
    self.content.text=model.content;
}
@end
