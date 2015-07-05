//
//  ArticalCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
#import "Define.h"
@implementation ArticalCell

- (void)awakeFromNib {
    // Initialization code
}

+(CGFloat)heightOfModel:(ArticleModel*)model
{
    CGFloat labelHeight = [LZXHelper textHeightFromTextString:[LZXHelper parseXml:model.content] width:kScreenSize.width-6 fontSize:13];
    if ([model.caipuid isEqualToString:@""]||[model.imageid isEqualToString:@""]) {
         return 145 + labelHeight+1;
    }else{
    return 295 + labelHeight+3;
    }
    
   
   
}

-(void)showDataWithModel:(ArticleModel*)model{
    CGRect titleFrame=self.titleLabel.frame;;
  if ([model.caipuid isEqualToString:@""]) {
        CGRect frame=self.nextImage.frame;
        frame.size.height=0;
        self.nextImage.frame=frame;
     CGRect imageFrame=self.image.frame;
     imageFrame.origin.y=CGRectGetMaxY(self.nextImage.frame);
     self.image.frame=imageFrame;
     titleFrame.origin.y=CGRectGetMaxY(self.image.frame)+3;
}
    if ([model.imageid isEqualToString:@""]) {
       CGRect frame=self.image.frame;
        frame.size.height=0;
        self.image.frame=frame;
        
        titleFrame.origin.y=CGRectGetMaxY(self.nextImage.frame)+3;
     
        
    }
    self.nextImage.image=[UIImage imageNamed: @"background121 2"];
    titleFrame.origin.y=CGRectGetMaxY(self.image.frame)+3;
    if (self.next) {
        self.next(self.nextImage);
    }
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:[UIImage imageNamed: @"background12"]];
  
   self.titleLabel.text=[LZXHelper parseXml:model.content];
 
    titleFrame.size.height=[LZXHelper textHeightFromTextString:[LZXHelper parseXml:model.content] width:self.titleLabel.frame.size.width fontSize:12]+2;
    self.titleLabel.frame=titleFrame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
