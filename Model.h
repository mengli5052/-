//
//  Model.h
//  practice1
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
/**
 *  "author": "欧尼宝贝",
 "displaytime": "2015-06-11",
 "id": "920",
 "imageid": "9160582",
 "ontop": "0",
 "status": "2",
 "title": "老人健忘怎么办?",
 "uptime": "2015-06-11 15:48:31.0",
 "uri": "http://www.ecook.cn/public/weiboDetail.shtml?mid=9159806"
 */
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *displaytime;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *imageid;
@property(nonatomic,copy)NSString *ontop;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *uptime;
@property(nonatomic,copy)NSString *uri;
@end
