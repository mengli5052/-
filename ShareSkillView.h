//
//  ShareSkillView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^JumpBrillianceBlock) ();
typedef void(^JumpLatestBlock) ();
typedef void(^JumpTopicBlock) ();
typedef void(^JumpGottalentBlock) ();
typedef void(^UpdateFramBlock) (CGRect rect);
@interface ShareSkillView : UIView
{
    JumpBrillianceBlock _brilliance;
    JumpLatestBlock _latest;
   JumpTopicBlock _topic;
    JumpGottalentBlock _gottalent;
}
@property (weak, nonatomic) IBOutlet UIButton *brillanceButton;
@property (weak, nonatomic) IBOutlet UIButton *latestButton;
@property (weak, nonatomic) IBOutlet UIButton *followButton;
@property (weak, nonatomic) IBOutlet UIButton *gottalentButton;
@property(nonatomic,copy)UpdateFramBlock block;
- (IBAction)brillanceClick:(id)sender;
- (IBAction)latestClick:(id)sender;
- (IBAction)topicClick:(id)sender;
- (IBAction)gottalentClick:(id)sender;
-(void)setBrillianceBlock:(JumpBrillianceBlock)myBlock;
-(JumpBrillianceBlock)myBlock;
-(void)setLatestBlock:(JumpLatestBlock)latestBlock;
-(JumpLatestBlock)latestBlock;
-(void)setTopicBlock:(JumpTopicBlock)topicBlock;
-(JumpTopicBlock)topicBlock;
-(void)setGottalenBlock:(JumpGottalentBlock)gottalenBlock;
-(JumpGottalentBlock)gottalenBlock;
-(void)showButton;
@end
