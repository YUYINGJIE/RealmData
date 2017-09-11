//
//  RLMManagerTools.h
//  YJRealm
//
//  Created by 于英杰 on 2017/9/11.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>
@interface RLMManagerTools : NSObject



// 分配路径并搭建表
/*
自定义数据库(名称、路径)
DataBaseName  表名

*/
+ (void)setDefaultRealmForUser:(NSString *)DataBaseName;


@end
