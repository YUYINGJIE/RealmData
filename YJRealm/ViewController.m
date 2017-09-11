//
//  ViewController.m
//  YJRealm
//
//  Created by 于英杰 on 2017/9/7.
//  Copyright © 2017年 Mr.YuYingjie. All rights reserved.
//

#import "ViewController.h"
#import "UserPerson.h"
#import "RLMManagerTools.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *UserschoolTextField;
@property (weak, nonatomic) IBOutlet UITextField *userIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    //  本想封装 后来懒惰了。也觉着必要性不是很大  只是写个demo

    
    
    
    
    [RLMManagerTools setDefaultRealmForUser:@"database"];
    
    NSLog(@"%@",NSHomeDirectory());
    
}

- (IBAction)addClick:(id)sender {
    
    
    // 填写数据再添加。主键不能重复
    
    // 方式 1
    UserPerson* person = [[UserPerson alloc] init];
    person.username= _nameTextField.text;
    person.userage = [_ageTextField.text intValue];
    person.userId = [_userIdTextField.text intValue];
    person.type = [_typeTextField.text intValue];
    person.weight = [_weightTextField.text intValue];
    person.Userschool =_UserschoolTextField.text;
    
   
//    // 方式2
//    UserPerson *UserPerson2 = [[UserPerson alloc]initWithValue:@{@"username":_nameTextField.text,
//                                              @"userage" :@[_ageTextField.text],
//                                              @"userId"  :@[_userIdTextField.text],
//                                              @"type" :@[_typeTextField.text],
//                                              @"weight" :@[_weightTextField.text],
//                                              @"Userschool" :@[_UserschoolTextField.text],
//                  
//                                              }];
    
    
    RLMResults *tanDogs = [UserPerson objectsWhere:[NSString stringWithFormat:@"userId = %@",@([_userIdTextField.text integerValue])] ];
    if (tanDogs.count!=0) {
        
        NSLog(@"添加失败。主键 userId 已经存在了");
        
        return;
    }
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:person];
    [realm commitWriteTransaction];
    
}

// 删除
- (IBAction)deleteClick:(id)sender {

    
    RLMResults *persons = [UserPerson objectsWhere:[NSString stringWithFormat:@"type = %@",@([_userIdTextField.text integerValue])] ];

    
   
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
  
     // 删除多条记录
    [realm deleteObjects:persons];
    
    
//    // 删除单条记录
//    [realm deleteObject:person];
//   
//    // 删除所有记录
//    [realm deleteAllObjects];
//    
    
    
    [realm commitWriteTransaction];
 
    
}


// 查询
- (IBAction)SearchClick:(id)sender {
    
    
    
    
    
    //1 查询所有
    RLMResults *persons = [UserPerson allObjects];
    NSLog(@"%@",persons);
    
    //2 条件查询
    RLMResults *tanDogs = [UserPerson objectsWhere:[NSString stringWithFormat:@"userId = %@",@([_userIdTextField.text integerValue])] ];
      NSLog(@"%@",tanDogs);
    
    
    //3 根据条件查询结果 并排序 生序or降序 yes or  no
    RLMResults *results = [[UserPerson objectsWhere:@"type = 1 "] sortedResultsUsingKeyPath:@"userId" ascending:YES];
    NSLog(@"%@",results);

    //4 区间查询
    RLMResults *resultswos= [[UserPerson objectsWhere:@"userId BETWEEN %@", @[@0, @1]] sortedResultsUsingKeyPath:@"userId" ascending:YES];
    NSLog(@"%@",resultswos);

    
    
    
    //不支持分页
    
    
//    // Query using an NSPredicate object
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"color = %@ AND name BEGINSWITH %@",
//                         @"tan", @"B"];
//    tanDogs = [Dog objectsWithPredicate:pred];

}


// 更新
- (IBAction)UpdataCliuck:(id)sender {
    
    
    
    // 1 方式1
//    UserPerson* person = [[UserPerson alloc] init];
//    person.username= _nameTextField.text;
//    person.userage = [_ageTextField.text intValue];
//    person.userId = [_userIdTextField.text intValue];
//    person.type = [_typeTextField.text intValue];
//    person.weight = [_weightTextField.text intValue];
//    person.Userschool =_UserschoolTextField.text;
//    RLMRealm *realm = [RLMRealm defaultRealm];
//
//    [realm beginWriteTransaction];
//    [realm addOrUpdateObject:person];
//    
//    [realm commitWriteTransaction];
    
    
    // 方式 2
    RLMResults *results = [[UserPerson objectsWhere:@"type = 0 "] sortedResultsUsingKeyPath:@"userId" ascending:YES];
    NSLog(@"%@",results);
    
    RLMRealm *realm = [RLMRealm defaultRealm];

    for (UserPerson* person in results) {
        
        UserPerson* persons = [[UserPerson alloc] init];
           persons.username= _nameTextField.text;
            persons.userage = [_ageTextField.text intValue];
            persons.userId = person.userId;
            persons.type = [_typeTextField.text intValue];
            persons.weight = [_weightTextField.text intValue];
            persons.Userschool =_UserschoolTextField.text;
        
        [realm beginWriteTransaction];
        
        
        [realm addOrUpdateObject:persons];
        [realm commitWriteTransaction];
        
    }
    
    
    
}

@end
