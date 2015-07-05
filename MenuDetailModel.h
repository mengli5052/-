//
//  MenuDetailModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuDetailModel : NSObject
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *collectNum;
@property(nonatomic,copy)NSString *collectid;
@property(nonatomic,copy)NSString *commentNum;
@property(nonatomic,copy)NSString *content;

@property(nonatomic,copy)NSString *ctype;
@property(nonatomic,copy)NSArray *discussionPoList;
@property(nonatomic,copy)NSString *editid;
@property(nonatomic,copy)NSString *editname;
@property(nonatomic,copy)NSNumber *enjoyNum;

@property(nonatomic,copy)NSNumber *evaluationPo;
 @property(nonatomic,copy)NSNumber *flower;
@property(nonatomic,copy)NSDictionary *gettime;
@property(nonatomic,copy)NSString *havebom;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSDictionary *imageSizePo;
@property(nonatomic,copy)NSString *imageid;
@property(nonatomic,copy)NSArray *imageidList;
@property(nonatomic,copy)NSArray *isrec;
@property(nonatomic,copy)NSArray *materialList;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *qqChinaPo;
@property(nonatomic,copy)NSDictionary *referencePo;
@property(nonatomic,copy)NSNumber *sortCommonPo;
@property(nonatomic,copy)NSString *state;
@property(nonatomic,copy)NSArray *stepList;

 

@property(nonatomic,copy)NSArray *tagsPoList;
@property(nonatomic,copy)NSArray *tipsList;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *version;
@property(nonatomic,copy)NSString *wpo;


 

@end
