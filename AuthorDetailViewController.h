//
//  AuthorDetailViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorDetailViewController : UIViewController
@property(nonatomic,copy)NSString *frienduid;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *fans;
@property (weak, nonatomic) IBOutlet UIButton *collectMenu;
@property (weak, nonatomic) IBOutlet UIButton *likes;
@property (weak, nonatomic) IBOutlet UIButton *privateKitchen;
@property (weak, nonatomic) IBOutlet UIButton *topics;
@property (weak, nonatomic) IBOutlet UITextView *keyWords;

@end
