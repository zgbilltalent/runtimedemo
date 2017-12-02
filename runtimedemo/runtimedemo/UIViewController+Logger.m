//
//  UIViewController+Logger.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/18.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "UIViewController+Logger.h"
#import <objc/runtime.h>
@implementation UIViewController (Logger)

+ (void)load {
//    NSString*className=NSStringFromClass(self.class);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class targetClass = [self class];
        SEL originalSelector = @selector(viewDidAppear:);
        SEL swizzledSelector = @selector(swizzled_viewDidAppear:);
        swizzleMethod(targetClass, originalSelector, swizzledSelector);
    });
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    IMP swizzledImp = method_getImplementation(swizzledMethod);
    char *swizzledTypes = (char *)method_getTypeEncoding(swizzledMethod);
    
    IMP originalImp = method_getImplementation(originalMethod);
    
    char *originalTypes = (char *)method_getTypeEncoding(originalMethod);
    BOOL success = class_addMethod(class, originalSelector, swizzledImp, swizzledTypes);
    if (success) {
        class_replaceMethod(class, swizzledSelector, originalImp, originalTypes);
    }else {
        // 添加失败，表明已经有这个方法，直接交换
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)swizzled_viewDidAppear:(BOOL)animation {
    [self swizzled_viewDidAppear:animation];
    NSLog(@"进入的类： %@ ", NSStringFromClass([self class]));
}

-(void)mehtod001{
    NSLog(@"LOggggg---===============");
}


@end
