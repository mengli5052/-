//
//  MaterialListModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/17.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MaterialListModel : NSObject
/*
 "contentid": "3387320",
 "dosage": "250g",
 "id": "219223",
 "mwikipediaid": "118527",
 "name": "高筋粉",
 "ordernum": 0,
 "version": 0
 */
@property(nonatomic,copy)NSString *contentid;
@property(nonatomic,copy)NSString *dosage;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *mwikipediaid;
@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSNumber *ordernum;
@property(nonatomic,copy)NSNumber *version;

@end
