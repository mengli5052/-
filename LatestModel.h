//
//  LatestModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/15.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LatestModel : NSObject

/*
 "addtime": "06-10 19:32",
 "addtimeFull": "2015-06-10 19:32:23",
 "bannerimageid": "",
 "collectionid": "",
 "comment": 2,
 */
@property(nonatomic,copy)NSString *addtime;
@property(nonatomic,copy)NSString *addtimeFull;
@property(nonatomic,copy)NSString *bannerimageid;
@property(nonatomic,copy)NSString *collectionid;
@property(nonatomic,copy)NSNumber *comment;
/*
 "disabled": "0",
 "enjoy": 0,
 "forward": 0,
 "id": "9154330",
 "list": "",
 */
@property(nonatomic,copy)NSString *disabled;
@property(nonatomic,copy)NSNumber *enjoy;
@property(nonatomic,copy)NSNumber *forward;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *list;
/*
 "mid": "",
 "nickname": "漆黑",
 "pic": "5411726",
 "picid": "9154333",
 "region": "",
 */
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *picid;
@property(nonatomic,copy)NSString *region;
/*
 "terminal": "3",
 "title": "〈他 〉第一次下厨",
 "total": 0,
 "type": "0",
 "uid": "5411725",
 */
@property(nonatomic,copy)NSString *terminal;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSNumber *total;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *uid;
/*
 "updatetime": "2015-06-11 12:18:37.0",
 "usercontent": "",
 "weibo": "炒土豆块"
 */
@property(nonatomic,copy)NSString *updatetime;
@property(nonatomic,copy)NSString *usercontent;
@property(nonatomic,copy)NSString *weibo;
@end
