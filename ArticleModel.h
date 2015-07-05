//
//  ArticleModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

/*
 "alength": 0,
 "audioid": "",
 "caipuid": "",
 "cid": "9075593",
 "content": "2.烤梨子配上枫糖轻乳酪奶油",
 */
@property(nonatomic,copy)NSNumber *alength;
@property(nonatomic,copy)NSString *audioid;
@property(nonatomic,copy)NSString *caipuid;
@property(nonatomic,copy)NSString *cid;
@property(nonatomic,copy)NSString *content;
/*
 "contentPo": null,
 "dateline": "2015-06-01 09:39:11",
 "disabled": "0",
 "end": 0,
 "imageid": "9075590",
 */
@property(nonatomic,copy)NSNumber *contentPo;
@property(nonatomic,copy)NSString *dateline;
@property(nonatomic,copy)NSString *disabled;
@property(nonatomic,copy)NSNumber *end;
@property(nonatomic,copy)NSString *imageid;
/*
 "m_uid": "7961810",
 "mid": "9075589",
 "musername": "爱背包的小厨子",
 "pic": "7962609",
 "post_ip": "",
 */
@property(nonatomic,copy)NSString *m_uid;
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *musername;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *post_ip;
/*
 "replyComment": [],
 "reply_cid": "",
 "reply_uid": "",
 "replyname": "",
 "source": "1",
 */
@property(nonatomic,copy)NSArray *replyComment;
@property(nonatomic,copy)NSString *reply_cid;
@property(nonatomic,copy)NSString *reply_uid;
@property(nonatomic,copy)NSString *replyname;
@property(nonatomic,copy)NSString *source;
/*
 "start": 0,
 "topicid": "",
 "total": "",
 "uid": "7961810"
 */
@property(nonatomic,copy)NSNumber *start;
@property(nonatomic,copy)NSString *topicid;
@property(nonatomic,copy)NSString *total;
@property(nonatomic,copy)NSString *uid;

@end
