//
//  HeaderView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/17.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuDetailModel.h"
@interface HeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *upLoadButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
@property (weak, nonatomic) IBOutlet UILabel *title;

- (IBAction)sharClick:(id)sender;
- (IBAction)uploadClick:(id)sender;
- (IBAction)menuClick:(id)sender;
- (IBAction)collectClick:(id)sender;
-(void)showDataWithModel:(NSString*)imageId title:(NSString*)title;

@end
