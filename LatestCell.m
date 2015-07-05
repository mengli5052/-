//
//  LatestCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/15.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
#import "Define.h"
@implementation LatestCell

- (void)awakeFromNib {
//    self.iconImage.layer.masksToBounds=YES;
//    self.iconImage.layer.cornerRadius=40;
}
-(void)showDataWithModel:(LatestModel*)model{
    self.titleLabel.text=model.title;
 
    
    if ([model.enjoy.stringValue isEqualToString:@"0"]||[model.forward.stringValue isEqualToString:@"0"]) {
        self.enjoyButton.hidden=YES;
        self.forwordButton.hidden=YES;
    }else{
    [self.enjoyButton setTitle:[NSString stringWithFormat:@" %@",model.enjoy.stringValue] forState:UIControlStateNormal];
        [self.forwordButton setTitle:[NSString stringWithFormat:@" %@",model.forward.stringValue] forState:UIControlStateNormal];
    }
    
     [self.forwordButton setTitle:[NSString stringWithFormat:@"  %@",model.forward.stringValue] forState:UIControlStateNormal];
    self.titleLabel.text=model.nickname;
    self.title2Label.text=model.title;
   
 self.timeLabel.text=[NSString stringWithFormat:@"发表:%@",[LZXHelper prettyDateWithReference:model.addtimeFull formater:nil]];
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.picid]] placeholderImage:[UIImage imageNamed: @"qzone"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
