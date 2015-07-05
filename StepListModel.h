//
//  StepListModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/17.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StepListModel : NSObject
/*
 "contentid": "3387320",
 "details": "除黄油以外的所有材料揉成团，酵母不要直接接触糖，盐。可先将糖盐与面粉混合搅匀后再加入酵母，也可将酵母溶解于温水中",
 "id": "160822",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 */
@property(nonatomic,copy)NSString *contentid;
@property(nonatomic,copy)NSString *details;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *imageid;
@property(nonatomic,copy)NSNumber *ordernum;
@property(nonatomic,copy)NSNumber *time;
@property(nonatomic,copy)NSNumber *version;
@end
