//
//  AppDelegate.m
//  YJRealm
//
//  Created by 于英杰 on 2017/9/7.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
    
    // 官方也正在更新。 所以 没必要封装精华。等稳定后再进一步回顾。方法不断迭代 望理解。以前的好多方法报错，很无奈
    
    //   Realm支持数据库加密   一般用不到。之后还会更新。
    
    /*
    
    
      产生随机密钥
     NSMutableData *key = [NSMutableData dataWithLength:64];
     SecRandomCopyBytes(kSecRandomDefault, key.length, (uint8_t *)key.mutableBytes);
     
     // 打开加密文件
     RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
     config.encryptionKey = key;
     NSError *error = nil;
     RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
     if (!realm) {
     // 如果密钥错误，`error` 会提示数据库不可访问
     NSLog(@"Error opening realm: %@", error);
     }
    
     
     
      // 很简单的。 官方demo 就有案例。 而 RLMLinkingObjects属性并不能使用 KVO 进行观察。
     Realm KVC和KVO特性
     
     RLMResults<Person *> *persons = [Person allObjects];
     [[RLMRealm defaultRealm] transactionWithBlock:^{
     [[persons firstObject] setValue:@YES forKeyPath:@"isFirst"]; // 将每个人的 planet 属性设置为“地球”
     [persons setValue:@"地球" forKeyPath:@"planet"];
     }];
     
     
     
    **/
    
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
