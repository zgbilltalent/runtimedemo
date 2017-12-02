//
//  ViewController.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/16.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "ViewController.h"
#import <objc/Runtime.h>
#import "Person.h"
#import <objc/message.h>
#import "Person+PerCategory.h"

#import "BlockDemoVc.h"
#import "MasonVC.h"
#import "UIViewController+AAA.h"
#import "UIViewController+Logger.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
     
//    [objc_msgSend];
    [self mehtod001];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnClick:(UIButton *)sender {
    //演示001 假如不实现 test001 会抛什么异常
//    在编译的时候并不能决定真正调用哪个函数，只有在真正运行的时候才会根据函数的名称找到对应的函数来调用。
    
    [self test001];
}

// 示例 1:objc_msgSend 
-(void)test001{
    unsigned int outCount = 0;// 获取属性列表
    objc_property_t *properites = class_copyPropertyList([Person class], &outCount);
    NSLog(@"%d",outCount);

//    for (NSInteger i = 0;  i < outCount; i++) {
//        NSString *name = @(property_getName(properites[i]));
//        NSString *attributes = @(property_getAttributes(properites[i]));
//        NSLog(@"%@--------%@", name, attributes);
//    }
//    NSLog(@"%@", NSStringFromClass([super class]));
    
    
    //获取方法列表
    
    Method *methodList = class_copyMethodList([Person class], &outCount);

    for(NSInteger i = 0;  i < outCount; i++){

        Method method = methodList[i];

        NSLog(@"method---->%@",NSStringFromSelector(method_getName(method)));

        }
//
    
    //获取成员变量列表
    //获取协议列表
    
//    Person *p = [Person new];
//    p.personSay;
//    objc_msgSend();
//    /** 响应式*/
//    p.personSay.personSleep();
    
}


//-(void)method001{
//    SEL aSel = @selector(test001);
//
//}
// 动态添加方法
int dynamci(id self, SEL _cmd)
{
    NSLog(@"已新增方法:NewMethod");
    return 1;
}

// 动态添加
- (IBAction)btnAddClick:(UIButton *)sender {
    /* 动态添加方法：
     第一个参数表示Class cls 类型；
     第二个参数表示待调用的方法名称；
     第三个参数(IMP)myAddingFunction，IMP一个函数指针，这里表示指定具体实现方法myAddingFunction；
     第四个参数表方法的参数，0代表没有参数；
     */
    Person *p = [[Person alloc] init];
    class_addMethod([p class], @selector(NewMethod), (IMP)dynamci, 0);
      [p performSelector:@selector(NewMethod)];
 }

// category add Property
- (IBAction)btnAddProperty:(UIButton *)sender {
    Person *p = [[Person alloc] init];
    p.height = 15 ;
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


- (IBAction)methodSWClick:(UIButton *)sender {
    Person *p1 = [[Person alloc] init];
    [p1 run];
    
    [self replacePeopleRunMethod];
    [p1 run];
}

- (void)runFast {
    NSLog(@"People run fast");
}

/*
*  替换 Person 类中 run 方法的实现
*/
- (void)replacePeopleRunMethod {
    
    Class peopleClass = NSClassFromString(@"Person");
    SEL peopleRunSel = @selector(run);
    Method methodRun = class_getInstanceMethod(peopleClass, peopleRunSel);
    // 获取 run 方法的参数 （包括了 parameter and return types）
    char *typeDescription = (char *)method_getTypeEncoding(methodRun);
    
    // 获取 runFast 方法的实现
    IMP runFastImp = class_getMethodImplementation([self class], @selector(runFast));
    
    // 给 People 新增 runFast 方法，并指向的当前类中 runFast 的实现
    class_addMethod(peopleClass, @selector(runFast), runFastImp, typeDescription);
    
    // 替换 run 方法为 runFast 方法
    class_replaceMethod(peopleClass, peopleRunSel, runFastImp, typeDescription);
}


- (IBAction)BlockClick:(UIButton *)sender {
 UIStoryboard *ub = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
 BlockDemoVc *vc =    [ub instantiateViewControllerWithIdentifier:@"BlockDemoVc"];
    vc.confirmData = ^{
        NSLog(@"完成----");
    };
    
    vc.backbroudColor =^(UIColor *color){
        self.view.backgroundColor = color ;
    };
    
//    self.presentedViewController;
    [self.navigationController  pushViewController:vc animated:YES];
//    [self]

}
// Mar 点击
- (IBAction)btnMarClick:(UIButton *)sender {

    MasonVC *vc = [[MasonVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark GCD 线程
- (IBAction)btnGCDClick:(UIButton *)sender {
   // 创建穿行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("com.tinfinite.ryeagleSerialQueue", NULL);

    //    每当创建一个串行队列的时候就会新增一个线程，那么多个串行队列上的任务将会并行执行。
    
    dispatch_queue_t concurentQueue = dispatch_queue_create("com.tinfinite.ryeagleSerialQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t mainDispatchQueue = dispatch_get_main_queue();
    
    /*第一个参数决定了不同的优先级*/
    dispatch_queue_t globalDispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            /*
             Task
             */
        });
    });
    
    
}

@end
