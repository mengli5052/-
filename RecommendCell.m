//
//  RecommendCell.m
//  practice1
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "RecommendCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
#import "Define.h"
@implementation RecommendCell

- (void)awakeFromNib {
    self.iconImage.layer.masksToBounds=YES;
    self.iconImage.layer.cornerRadius=4;
}

-(void)showDataWithModel:(Model*)model{
    self.imageView.frame=CGRectMake(10, 10, 80, 80);
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:[UIImage imageNamed: @"qzone"]];
    self.authorImage.frame=CGRectMake(95, 68, 9, 11);
    self.authorImage.image=[UIImage imageNamed: @"Icon_Author"];
    self.author.frame=CGRectMake(107, 50, 110, 30);
    self.author.text=model.author;
    self.time.frame=CGRectMake(230, 50, 90, 30);
    self.time.text=model.displaytime;
    self.title.frame=CGRectMake(110, 10, 210, 30);
    self.title.text=model.title;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
