//
//  dailyMenuModel.h
//  practice1
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dailyMenuModel : NSObject
/**
 *  "date": "2015-06-11",
 "healthtag": "normal",
 "id": "6564",
 "imageid": "277749",
 "name": "山药薏米粥",
 "ordernum": "1",
 "recipeid": "91402",
 "type": "breakfast"
 */
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *healthtag;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *ordernum;
@property(nonatomic,copy)NSString *recipeid;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *imageid;
@end
