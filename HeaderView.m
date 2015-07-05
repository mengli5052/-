//
//  HeaderView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/17.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@implementation HeaderView


-(void)showDataWithModel:(NSString *)imageId title:(NSString*)title{
    self.title.text=title;
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,imageId]] placeholderImage:[UIImage imageNamed: @"background12"]];
    [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
    self.shareButton.userInteractionEnabled=NO;
    [self.upLoadButton setTitle:@"上传我做的" forState:UIControlStateNormal];
    self.upLoadButton.userInteractionEnabled=NO;
    [self.menuButton setTitle:@"菜单" forState:UIControlStateNormal];
    [self.collectButton setTitle:@"收集" forState:UIControlStateNormal];
    self.menuButton.userInteractionEnabled=NO;
    self.collectButton.userInteractionEnabled=NO;
    [self.shareButton setTitleEdgeInsets:UIEdgeInsetsMake(self.shareButton.imageView.frame.size.height-5,-43, 0, 0)];
     [self.upLoadButton setTitleEdgeInsets:UIEdgeInsetsMake(self.upLoadButton.imageView.frame.size.height-5, -43, 0, 0)];
     [self.menuButton setTitleEdgeInsets:UIEdgeInsetsMake(self.menuButton.imageView.frame.size.height-5, -43, 0, 0)];
     [self.collectButton setTitleEdgeInsets:UIEdgeInsetsMake(self.collectButton.imageView.frame.size.height-5, -43, 0, 0)];
    
     [self.shareButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, 0)];
      [self.upLoadButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, 0)];
      [self.menuButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, 0)];
      [self.collectButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, 0)];
   
    
    
}
- (IBAction)sharClick:(id)sender {
}

- (IBAction)uploadClick:(id)sender {
}

- (IBAction)menuClick:(id)sender {
}

- (IBAction)collectClick:(id)sender {
}
@end
