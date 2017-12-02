//
//  UIImage+MyImage.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/18.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "UIImage+MyImage.h"

@implementation UIImage (MyImage)

+ (instancetype)imageWithName:(NSString *)name{
    // 这里调用imageWithName，相当于调用imageName
    UIImage*image = [self imageWithName:name];
    if(image == nil) {
        NSLog(@"加载空的图片");
    }
    return image;
};

@end
