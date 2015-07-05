//
//  MenuDetailViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ImageIdBlock) (NSString *imageId);
@interface MenuDetailViewController : UIViewController
{
    ImageIdBlock _myBlock;
}
@property(nonatomic,copy)NSString *cid;

-(void)setMyBlock:(ImageIdBlock)myBlock;
-(ImageIdBlock)myBlock;

@end
