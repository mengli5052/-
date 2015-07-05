//
//  DataCenter.h
//  Login&RegisterView
//
//  Created by LZXuan on 15-5-11.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 数据中心，三个界面共享注册信息，这时我们可以封装一个数据中心，进行数据的存储和读取，为了让三个界面共享数据，我们可以设计为单例
 
 //把 用户信息进行存储  :用户信息有三项，这三项是一个整体，把一个用户看做一个对象，所以我们可以设计一个用户类存储每个用户的信息。(数据模型类 存储数据)
 
 */
@interface DataCenter : NSObject
//获取单例方法
+ (instancetype)defaultDataCenter;

//存储数据
- (void)setValue:(id)value forKey:(NSString *)key;

//获取数据
- (id)valueForKey:(NSString *)key;

@end






