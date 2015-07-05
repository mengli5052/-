//
//  GottalenCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "GottalenCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@implementation GottalenCell

- (void)awakeFromNib {
    self.iconImae.layer.masksToBounds=YES;
    self.iconImae.layer.cornerRadius=30;
}
-(void)showDataWithModel:(GottalenModel*)model{
   
        
    
        self.usernameLabel.text=model.title;
        self.contentLabel.text=model.profile;
        self.regionLabel.text=model.region;
        [self.iconImae sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.pic]] placeholderImage:[UIImage imageNamed: @"qzone"]];
   
   
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
