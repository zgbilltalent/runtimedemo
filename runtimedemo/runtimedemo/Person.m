//
//  Person.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/16.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "Person.h"
@interface Person()

@property (nonatomic ,copy) NSString *mydName;

@end
@implementation Person


-(Person *)personRun{
    NSLog(@"I am Run");
    return self;
}

-(Person *)personDrink{
    NSLog(@"I am drink");
    return self;
}


-(Person *)personSay{
    NSLog(@"I am say");
    return self;
}

// 没有返回值,也没有参数
// void,(id,SEL)
void aaa(id self, SEL _cmd, NSNumber *meter) {
    
    NSLog(@"跑了%@", meter);
    
}

// // 任何方法默认都有两个隐式参数,self,_cmd（_cmd代表方法编号，打印结果为当前执行的方法名）
// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
// 作用:动态添加方法,处理未实现
//不存在类方法调用方法，会调用这个方法，默认会调用这个方法，默认返回NO
//+(BOOL)resolveClassMethod:(SEL)sel{
//    if (sel == @selector(aaa:)) {
//
//        /**
//         *  动态添加方法
//         *
//         *  @param self cls:为哪个类添加方法
//         *  @param sel  SEL:添加方法的方法编号（方法名）是什么
//         *  @param IMP  IMP:方法实现
//         *  @param const char * types方法类型
//         *
//         *  @return 返回是否添加成功
//         */
//        BOOL isSuccess = class_addMethod(self, sel, (IMP)aaa, "v@:@");
//
//        return isSuccess;
//
//    }
//
//    return [super resolveInstanceMethod:sel];
//}




-(id)forwardingTargetForSelector:(SEL)aSelector{
   // 这个方法是将你调用的不存在的方法重定向到一个其它声明了这个方法类，只需要返回这个方法的target
    return nil ;
}

- (void)run {
    NSLog(@"People run Person");
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    // 方法将你调用不存在的方法打包成NSInvocation 传给你，做完自己的处理，调用invokeWithTarget 让某个traget触发这个方法
}

- (Person *(^)(void))personSleep {
    Person *(^block)(void) = ^(){
        NSLog(@"personSleep");
        return self;
    };
    return block;
}


- (Person *(^)(void))personEat {
    Person *(^block)(void) = ^(){
        NSLog(@"personEat");
        return self;
    };
    return block;
}
@end
