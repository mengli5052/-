//
//  ArticalDetailHeaderView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LatestModel.h"
#import "LZXHelper.h"
#import "AFNetworking.h"
typedef void(^JumpNextBlock)() ;

typedef void(^UpdateFramBlock) (CGRect rect);
typedef void(^SaveModelBBlock) (LatestModel*model,NSString *weibo);
@interface ArticalDetailHeaderView : UIView
{
 NSMutableArray *_dataArr;
    JumpNextBlock _myBlock;
    
}
@property(nonatomic,copy)UpdateFramBlock block;
@property(nonatomic,copy)SaveModelBBlock saveModel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *authorAndTime;

@property(nonatomic,copy)NSString *weibo;
- (IBAction)authorAndTimeClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) NSString *mid;
@property(nonatomic)LatestModel *model;
-(void)showDataWithArr:(NSMutableArray*)arr;
-(void)setJumpNext:(JumpNextBlock)myBlock;
-(JumpNextBlock)myBlock;

@end
