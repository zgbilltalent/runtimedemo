//
//  Person.h
//  runtimedemo
//
//  Created by 张盖 on 2017/11/16.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *sssss;
}

/** 姓名 */
@property (strong, nonatomic) NSString *name;
/** age */
@property (assign, nonatomic) int age;
/** weight */
@property (assign, nonatomic) double weight;
- (void)run;

/**函数式编程  */
-(Person *)personRun;

-(Person *)personSay;

-(Person *)personDrink;

/** 响应式编程  **/
- (Person *(^)())personSleep;


@end
