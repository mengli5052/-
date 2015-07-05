//
//  ShareSkillView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ShareSkillView.h"

@implementation ShareSkillView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setBrillianceBlock:(JumpBrillianceBlock)myBlock{
    _brilliance=myBlock;
}
-(JumpBrillianceBlock)myBlock{
    return _brilliance;
}
-(void)setLatestBlock:(JumpLatestBlock)latestBlock{
    _latest=latestBlock;
}
-(JumpLatestBlock)latestBlock{
    return _latest;
}
-(void)setTopicBlock:(JumpTopicBlock)topicBlock{
    _topic=topicBlock;
}
-(JumpTopicBlock)topicBlock{
    return _topic;
}
-(void)setGottalenBlock:(JumpGottalentBlock)gottalenBlock{
    _gottalent=gottalenBlock;
}
-(JumpGottalentBlock)gottalenBlock{
    return _gottalent;
}
- (IBAction)brillanceClick:(id)sender {
    if (self.myBlock) {
        self.myBlock();
    }
}

- (IBAction)latestClick:(id)sender {
    if (self.latestBlock) {
        self.latestBlock();
    }
}

- (IBAction)topicClick:(id)sender {
    if (self.topicBlock) {
        self.topicBlock();
    }
}

- (void)awakeFromNib {

    
}
- (IBAction)gottalentClick:(id)sender {
    if (self.gottalenBlock) {
        self.gottalenBlock();
    }
}
-(void)showButton{
   [self.gottalentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.brillanceButton setTitleEdgeInsets:UIEdgeInsetsMake(self.brillanceButton.imageView.frame.size.height+14,-58, 0, 0)];
    [self.brillanceButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
    
    [self.latestButton setTitle:@"最新" forState:UIControlStateNormal];
    [self.latestButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.latestButton setTitleEdgeInsets:UIEdgeInsetsMake(self.latestButton.imageView.frame.size.height+14,-60, 0, 0)];
    [self.latestButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
    
    [self.followButton setTitle:@"关注" forState:UIControlStateNormal];
    [self.followButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.followButton setTitleEdgeInsets:UIEdgeInsetsMake(self.followButton.imageView.frame.size.height+14,-60, 0, 0)];
    [self.followButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
    
    [self.gottalentButton setTitle:@"达人推荐" forState:UIControlStateNormal];
    [self.gottalentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.gottalentButton setTitleEdgeInsets:UIEdgeInsetsMake(self.gottalentButton.imageView.frame.size.height+14,-56, 0, 0)];
    [self.gottalentButton setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
    CGRect frame=self.frame;
    frame.size.height=90;
    self.frame=frame;
    if (self.block) {
        self.block(self.frame);
    }
   
}
@end
