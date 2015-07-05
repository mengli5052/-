//
//  AppDelegate.m
//  KitchenOnline
//
//  Created by qianfeng01 on 15/7/4.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "AppDelegate.h"
#import "kitchenOnlineViewController.h"
//#import "MainSliderViewController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "Define.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)initUM {
    //注册appkey
    //558d15bd67e58eabb600049e
    //41D7EC0D
    [UMSocialData setAppKey:kUMengKey];
    //设置微信AppId、appSecret，分享url
    //WXAppId需要给当前应用程序 设置一个urlscheme:
    //两个app 程序之间可以通过 urlscheme(协议)进行通信
    //设置微信
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.1000phone.net"];
    //QQ空间
    [UMSocialQQHandler setQQWithAppId:@"1104669709" appKey:@"ZPaCN27JDGh3N9SX" url:@"http://www.1000phone.net"];
    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self initUM];
    kitchenOnlineViewController *kitchen=[[kitchenOnlineViewController alloc]init];
    
    self.window.rootViewController=kitchen;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
