//
//  RLMManagerTools.m
//  YJRealm
//
//  Created by 于英杰 on 2017/9/11.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import "RLMManagerTools.h"

@implementation RLMManagerTools
+ (void)setDefaultRealmForUser:(NSString *)DataBaseName {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    // Use the default directory, but replace the filename with the username
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]
                       URLByAppendingPathComponent:DataBaseName]
                      URLByAppendingPathExtension:@"realm"];
    
    // 设置是否直读 此处注释。
    //config.readOnly = YES;
    // Set this as the configuration used for the default Realm。 初始化及重新定义 RLMRealm *otherRealm = [RLMRealm defaultRealm];默认路径就是此路径
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
}
// 内存数据库在每次程序退出时不会保存数据
+ (void)setMemoryIdentifier:(NSString *)MemoryName {
    RLMRealmConfiguration *cfg = [RLMRealmConfiguration defaultConfiguration];
    cfg.inMemoryIdentifier = @"test";
    RLMRealm *realm = [RLMRealm realmWithConfiguration:cfg error:nil];
    
}


@end
