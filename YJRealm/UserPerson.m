//
//  UserPerson.m
//  YJRealm
//
//  Created by 于英杰 on 2017/9/11.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import "UserPerson.h"

@implementation UserPerson

// Specify default values for properties
/**
 添加默认值
 */
+ (NSDictionary *)defaultPropertyValues
{
    return @{@"type":@"1"
             };
}

// Specify properties to ignore (Realm won't persist these)
//忽略的字段
+ (NSArray *)ignoredProperties
{
    return @[@"weight"];
}
/**
 设置主键
 */
+ (NSString *)primaryKey{
    return @"userId";
}
/**
 添加索引的属性
 */
+ (NSArray *)indexedProperties{
    return @[@"username"];
}
@end



