//
//  UserPerson.h
//  YJRealm
//
//  Created by 于英杰 on 2017/9/11.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import <Realm/Realm.h>
/*
 
 说明：
 
 （1）Realm支持以下的属性（property）种类：BOOL, bool, int, NSInteger, long, float, double, CGFloat, NSString, NSDate 和 NSData。
 
 （2）你可以使用 RLMArray<Object> 和 RLMObject 来模拟对一或对多的关系(Realm也支持RLMObject继承)
 
 （3）Realm忽略了Objective-C的property attributes(如nonatomic, atomic, strong, copy, weak 等等）。 所以，推荐在创建模型的时候不要使用任何的property attributes。但是，假如你设置了，这些attributes会一直生效直到RLMObject被写入realm数据库。
 
 （4）定义了 RLM_ARRAY_TYPE(Article) 这个宏表示支持 RLMArray<Article> 该属性
 
 （5）另外Realm提供了以下几个方法供对属性进行自定义：
 
 1） + (NSArray *)indexedProperties; : 可以被重写来来提供特定属性（property）的属性值（attrbutes）例如某个属性值要添加索引。
 
 2） + (NSDictionary *)defaultPropertyValues; : 为新建的对象属性提供默认值。
 
 3） + (NSString *)primaryKey; : 可以被重写来设置模型的主键。定义主键可以提高效率并且确保唯一性。
 
 4） + (NSArray *)ignoredProperties; ：可以被重写来防止Realm存储模型属性。
 
 
 
 
 */




@interface UserPerson : RLMObject

//**   名字*/
@property NSString* username;
//**   年龄*/
@property int userage;
//**   学校*/
@property NSString* Userschool;
//**   用户id*/
@property NSInteger userId;
//**   数据ID*/
@property NSInteger id;
//**   用户类型*/
@property int type;

@property double weight;//重


@end
// This protocol enables typed collections. i.e.:
// RLMArray<UserPerson *><UserPerson>
RLM_ARRAY_TYPE(UserPerson)












