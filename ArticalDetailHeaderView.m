//
//  ArticalDetailHeaderView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalDetailHeaderView.h"
#import "AuthorDetailViewController.h"
#import "Define.h"
#import "UIImageView+WebCache.h"
@implementation ArticalDetailHeaderView
{
    CGRect rect ;
}


-(void)showDataWithArr:(NSMutableArray*)arr{
    
   LatestModel *model=[arr lastObject];
   self.titleLabel.text=model.title;
  [self.authorAndTime setTitle:[NSString stringWithFormat:@"作者:%@  %@",model.nickname,model.addtimeFull]forState:UIControlStateNormal];
    CGRect frame3=self.image.frame;
    frame3.origin.y=CGRectGetMaxY(self.authorAndTime.frame)+3;
    self.image.frame=frame3;
      [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.picid]] placeholderImage:[UIImage imageNamed: @"background12 "]];
     self.weibo=model.weibo;
    CGRect frame=self.contentLabel.frame;
    frame.origin.y=CGRectGetMaxY(self.image.frame)+15;
    self.weibo=[LZXHelper parseXml:model.weibo];
    frame.size.height=[LZXHelper textHeightFromTextString:self.weibo width:self.contentLabel.frame.size.width fontSize:11]+5;
    self.contentLabel.frame=frame;
    self.contentLabel.text=[LZXHelper parseXml:model.weibo];
    self.model=model;
    if (self.saveModel) {
        self.saveModel(self.model,self.weibo);
}
   CGRect frameView=self.frame;
   frameView.size.height=CGRectGetMaxY(self.contentLabel.frame)+3;
   self.frame=frameView;
   if (self.block) {
        self.block(self.frame);
    }
 }

-(void)setJumpNext:(JumpNextBlock)myBlock{
    _myBlock=myBlock;
}
-(JumpNextBlock)myBlock{
    return _myBlock;
}
- (IBAction)authorAndTimeClick:(id)sender {
    
        if (self.myBlock) {
            self.myBlock();
       
        
    }
}

@end
