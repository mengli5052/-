//
//  DataCenter.m
//  Login&RegisterView
//
//  Created by LZXuan on 15-5-11.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "DataCenter.h"
/*
 每增加一个用户我们可以把每个用户信息model 存放在数据中心的字典中(用户名作为key  model 作为值)，对字典进行归档。
 查数据 直接从_dict中获取，_dict 指向的对象和本地归档文件数据是同步
 */
@implementation DataCenter
{
    NSMutableDictionary *_dict;
}
//获取单例方法
+ (instancetype)defaultDataCenter {
    static DataCenter *center =nil;
    @synchronized(self) {
        if (center == nil) {
            center = [[self alloc] init];
        }
    }
    return center;
}
#pragma mark - 初始化
- (instancetype)init {
    if (self = [super init]) {
        NSString *filePath = [self getFullFilePathWithName:@"myData.archiver"];
        
        //检测文件是否存在
        //保证 _dict指向的对象 和 本地归档文件数据同步
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            
            //存在
            //读档 /解归档
            //成员变量变量是 对象指针 必须要拥有对象的绝对使用权 否则的话 对象可能随时释放
            _dict = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
            
        }else {
            //不存在
            //创建 空的可变字典
            //成员变量变量是 对象指针 必须要拥有对象的绝对使用权
            _dict = [[NSMutableDictionary alloc] init];
        }
        
    }
    return self;
}
//根据文件名 获取指定文件名的在沙盒Documents的 全路径
- (NSString *)getFullFilePathWithName:(NSString *)name {
    //方法1
   // NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //方法2:获取Documents
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = arr[0];
    
    //检测Documents是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:docPath]) {
        
    }else{
        NSLog(@"Documents不存在");
        //不存在那么创建一个
    }
    //拼接 文件在 Documents下的路径
    return [docPath stringByAppendingPathComponent:name];
}


//存储数据
- (void)setValue:(id)value forKey:(NSString *)key {
    //先存入字典
    [_dict setObject:value forKey:key];
    //立即归档 保证字典和 归档文件数据同步
    BOOL ret = [NSKeyedArchiver archiveRootObject:_dict toFile:[self getFullFilePathWithName:@"myData.archiver"]];
    
    if (!ret) {
        NSLog(@"归档失败");
    }
}

//获取数据
- (id)valueForKey:(NSString *)key {
    //从字典获取 _dict 和本地归档数据是同步的
    return _dict[key];
}
@end









