//
//  LZXHelper.m
//  Connotation
//
//  Created by LZXuan on 14-12-20.
//  Copyright (c) 2014年 LZXuan. All rights reserved.
//

#import "LZXHelper.h"

#import "NSString+Hashing.h"


@implementation LZXHelper
+(NSString*)loadMore:(NSArray *)arr {
    static NSInteger number=0;
    NSMutableString *str=[[NSMutableString alloc]init];
    NSInteger i=number*10;
    
    if(arr.count-number*10>=10) {
        for (; i<10*(number+1); i++) {
            [str appendString:arr[i]];
            [str appendString:@","];
            
        }
        [str deleteCharactersInRange:NSMakeRange(str.length-1, 1)];;
    }else if(arr.count - number*10 >0){
        for (; i<arr.count-number*10; i++) {
            [str appendString:arr[i]];
            [str appendString:@","];
        }
        [str deleteCharactersInRange:NSMakeRange(str.length-1, 1)];
    }else{
        return nil;
    }
    number++;
    
    return str;
}

+(NSString*)parseXml:(NSString*)str{
    NSArray *deArr=[str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>" ]];
    NSInteger index=(deArr.count-1)/4;
    if (deArr.count>=5) {
        NSMutableString *total=[[NSMutableString alloc]init];
        if (![deArr[0] isEqualToString:@""]) {
            [total appendFormat:@"%@\n",deArr[0]];
        }
        NSInteger i=0;
        while (i<index) {
            [total appendFormat:@"%@\n%@\n",deArr[2+4*i],deArr[4*(i+1)]];
            //NSLog(@"%@",total);
            //要设置特殊属性
            //NSArray *attributedArr=[deArr[1+4*i] componentsSeparatedByString:@"_"];
            //NSDictionary *specialDict=@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:[attributedArr[3] floatValue]]};
            
            ///[specialStr addAttributes:specialDict range:NSMakeRange([deArr[0] length], [deArr[2+4*i] length])];
            i++;
            
        }
        return total;
        
    }else{
        
        return str;
    }
    
    
    return nil;
}
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {
    //转化为Double
    double t = [timerStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t];
    //转化为 时间格式化字符串
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //转化为 时间字符串
    return [df stringFromDate:date];
}
//动态 计算行高
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    if ([LZXHelper getCurrentIOS] >= 7.0) {
        //iOS7之后
        /*
         第一个参数: 预设空间 宽度固定  高度预设 一个最大值
         第二个参数: 行间距 如果超出范围是否截断
         第三个参数: 属性字典 可以设置字体大小
         */
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
        
    }else {
        //iOS7之前
        /*
         1.第一个参数  设置的字体固定大小
         2.预设 宽度和高度 宽度是固定的 高度一般写成最大值
         3.换行模式 字符换行
         */
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
      
        CGSize textSize = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT)options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        return textSize.height;//返回 计算出得行高
    }
}

//获取iOS版本号
+ (double)getCurrentIOS {
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}
+ (CGSize)getScreenSize {
    return [[UIScreen mainScreen] bounds].size;
}
//获得当前系统时间到指定时间的时间差字符串,传入目标时间字符串和格式
+(NSDate*)stringNowToDate:(NSString*)toDate formater:(NSString*)formatStr
{
    
    NSDateFormatter *formater=[[NSDateFormatter alloc] init];
    if (formatStr) {
        [formater setDateFormat:formatStr];
    }
    else{
        [formater setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]];
    }
    NSDate *date=[formater dateFromString:toDate];
    
    //返回 date 和 当前系统时间的差
    return date;
    
}

//获得到指定时间的时间差字符串,格式在此方法内返回前自己根据需要格式化
+(NSString*)stringNowToDate:(NSDate*)toDate
{
    //创建日期 NSCalendar对象
    NSCalendar *cal = [NSCalendar currentCalendar];
    //得到当前时间
    NSDate *today = [NSDate date];
    
    //用来得到具体的时差,位运算
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    
    if (toDate && today) {//不为nil进行转化
        //分割 具体时间差
        NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:toDate options:0 ];
        
        //NSString *dateStr=[NSString stringWithFormat:@"%d年%d月%d日%d时%d分%d秒",[d year],[d month], [d day], [d hour], [d minute], [d second]];
        NSString *dateStr=[NSString stringWithFormat:@"%02ld:%02ld:%02ld",[d hour], [d minute], [d second]];
        return dateStr;
    }
    return @"";
}


//获取 缓存文件在 沙盒 的路径
//根据 一个 url 对文件 进行加密 命名

+ (NSString *)getFullPathWithMyCacheFile:(NSString *)url {
    
    //把自定义的缓存文件 放在 沙盒/Library/Caches/MyCaches/ 里面
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    //获取 自定义的MyCaches
    NSString *myCachePath = [cachePath stringByAppendingPathComponent:@"MyCaches"];
    //检测是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:myCachePath]) {
        //不存在 那么创建
        [[NSFileManager defaultManager] createDirectoryAtPath:myCachePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //对 url 字符串 md5 加密 转换一个新的字符串
    url = [url MD5Hash];
    
    //拼接 缓存文件在MyCaches 文件夹下的全路径
    NSString *filePath = [myCachePath stringByAppendingPathComponent:url];
    //NSLog(@"file:%@",filePath);
    return filePath;
}

//检测 缓存文件 是否超时

// 假设 检测 是否超时一小时 60*60

+ (BOOL)isTimeOutFile:(NSString *)urlPath time:(double)timeout {
    //我们 要拿 缓存文件的 修改时间 和 当前时间 的差值 和 timeout 进行比较
    
    //通过 传入 的url  获取缓存 文件的路径
    NSString *filePath = [self getFullPathWithMyCacheFile:urlPath];
    //获取文件属性
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:filePath error:nil];
    //获取 文件 最后修改时间
    NSDate * lastModify = [dict fileModificationDate];
    
    //算出 时间差(当前系统时间和文件最后修改时间)
    NSTimeInterval sub = [lastModify timeIntervalSinceDate:[NSDate date]];
    
    if (sub < 0) {
        sub = -sub;
    }
    
    if (sub > timeout) {
        return YES;//超时
    }else {
        return NO;//没有超时
    }
}
+ (NSString *)prettyDateWithReference:(NSString *)referenceStr formater:(NSString*)formater {
    NSDate *reference =[self stringNowToDate:referenceStr formater:nil];
    NSString *suffix = @"前";
    
    float different = [[NSDate date] timeIntervalSinceDate:reference];
    if (different < 0) {
        different = -different;
        suffix = @"现在";
    }
    
    // days = different / (24 * 60 * 60), take the floor value
    float dayDifferent = floor(different / 86400);
    
    int days   = (int)dayDifferent;
    int weeks  = (int)ceil(dayDifferent / 7);
    int months = (int)ceil(dayDifferent / 30);
    int years  = (int)ceil(dayDifferent / 365);
    
    // It belongs to today
    if (dayDifferent <= 0) {
        // lower than 60 seconds
        if (different < 60) {
            return @"just now";
        }
        
        // lower than 120 seconds => one minute and lower than 60 seconds
        if (different < 120) {
            return [NSString stringWithFormat:@"1 分钟 %@", suffix];
        }
        
        // lower than 60 minutes
        if (different < 660 * 60) {
            return [NSString stringWithFormat:@"%d 分钟 %@", (int)floor(different / 60), suffix];
        }
        
        // lower than 60 * 2 minutes => one hour and lower than 60 minutes
        if (different < 7200) {
            return [NSString stringWithFormat:@"1 小时 %@", suffix];
        }
        
        // lower than one day
        if (different < 86400) {
            return [NSString stringWithFormat:@"%d 小时%@", (int)floor(different / 3600), suffix];
        }
    }
    // lower than one week
    else if (days < 7) {
        return [NSString stringWithFormat:@"%d 天%@", days, suffix];
    }
    // lager than one week but lower than a month
    else if (weeks < 4) {
        return [NSString stringWithFormat:@"%d 周%@", weeks, suffix];
    }
    // lager than a month and lower than a year
    else if (months < 12) {
        return [NSString stringWithFormat:@"%d 月%@", months, suffix];
    }
    // lager than a year
    else {
        return [NSString stringWithFormat:@"%d 年%@", years, suffix];
    }
    
    return nil;
}

@end


