//
//  BlockDemoVc.h
//  runtimedemo
//
//  Created by 张盖 on 2017/11/21.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "ViewController.h"

@interface BlockDemoVc : ViewController
//如果用copy修饰Block，该Block就会存储在堆空间。则会对Block的内部对象进行强引用，导致循环引用。内存无法释放。
//新建一个指针(__weak typeof(Target) weakTarget = Target )指向Block代码块里的对象，然后用weakTarget进行操作。就可以解决循环引用问题。
@property(nonatomic, copy) void (^confirmData)(void);
/**
 * 定义一个changeColor 的Block ，这个changeColor 必须带一个参数，这个参数的类型必须为ID 无返回值
 */
typedef void(^changeColor)(id);

@property (nonatomic , copy)changeColor backbroudColor;

@end
