//
//  BlockDemoVc.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/21.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "BlockDemoVc.h"
// Block是一种比较特殊的数据类型。它可以保存一段代码，在合适的时候取出来调用
//苹果推荐的类型，在运行中保存代码，用来封装和保存代码
// 有点像函数，可以在任何时候执行
//1: Block 类型 _NSConcreteGlobalBlock（全局）
// 2: _NSConcreteStackBlock（栈）
// 3: _NSConcreteMallocBlock（堆）

@interface BlockDemoVc ()

@property(nonatomic ) int c  ;
@end

@implementation BlockDemoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)commClick:(UIButton *)sender {
    [self block001];
    
}

-(void)block001{
    __block  int d  = 10 ;
// 无参数 无返回值
    //    void(^myblock)(void) =^{
//        NSLog(@"%d",a);
//    };
    
//    有参数 无返回值
//    void(^twoBlck)(int ,int)=^(int a ,int b ){
//        NSLog(@"当前的%d ----%d",a,b);
//    };
    
    int (^twoBlck)(int ,int)=^(int a ,int b ){
                NSLog(@"当前的%d ----%d",a,b);
        
       
        
        return d++;
    };
    
    NSLog(@"打印数据%d",twoBlck(3,4)) ;
    
    NSLog(@"d-----:%d",d) ;
    
//    a = 30 ;
    NSLog(@"vvvvvvvvvvv ");
//有参数无返回值的Block
//    NSString *(^twoBlck)(NSString *,NSString *)=^(NSString *st1,NSString *str2){
//
//    return  [NSString stringWithFormat:@"%@%@",st1,str2];
//    };
//
//    //     twoBlck(3,4);
//     NSLog(@"%@", twoBlck(@"我是",@"Block"));
//    self.confirmData();

    UIColor *color = [UIColor grayColor];
    self.backbroudColor(color);
    [self.navigationController popViewControllerAnimated:YES];
 }

@end
