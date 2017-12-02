//
//  MasonVC.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/22.
//  Copyright © 2017年 张盖. All rights reserved.
//
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import "MasonVC.h"
//#import <Masonry/Masonry.h>

@interface MasonVC ()
@property(nonatomic ,strong) UIView *sv ;
@end

@implementation MasonVC
- (void)loadView
{
    [super loadView] ;
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]) / 2)] ;
//    customView.backgroundColor = [UIColor yellowColor] ;

//    WS(ws);
//     _sv= [UIView new];
//    _sv.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:_sv]; // View是控制器的一个属性
//    [_sv mas_makeConstraints:^(MASConstraintMaker *make){
//        make.center.equalTo(ws.view);
//        make.size.mas_equalTo(CGSizeMake(CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]) / 2));
//
//    }];
//
//    UIButton *tab = [UIButton new];
//    tab.titleLabel.text  = @"旋转";
//    [tab setBackgroundColor:[UIColor redColor]];
//    tab.titleLabel.textColor = [UIColor redColor];
//    [tab setTitle:@"旋转" forState:UIControlStateNormal];
//    [self.view addSubview:tab];
//
//    [tab addTarget:self action:@selector(roundView:) forControlEvents:UIControlEventTouchUpInside];
//    [tab mas_makeConstraints:^(MASConstraintMaker *make){
////        make.edges.equalTo(_sv);
////        make.top.equalTo(@(12));
//         make.size.mas_equalTo(CGSizeMake( 80 , 30 ));
//        make.top.equalTo(_sv.mas_bottom).with.offset(20);
//    }];
}

-(void)roundView:(UIButton *)btn{
//    [_sv mas_makeConstraints:^(MASConstraintMaker *make){
//        make.center.equalTo(ws.view);
//        make.size.mas_equalTo(CGSizeMake(CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]) / 2));
//
//    }];
    
//    [_sv mas_updateConstraints:^(MASConstraintMaker  *make){
//
//    }];
}

- (void)addNotifications {
    // 监测设备方向
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationChange) name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
//name:[UIApplicationDidChangeStatusBarOrientationNotification
//object:nil];
}

- (void)onDeviceOrientationChange {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)orientation;
    
    if (orientation == UIDeviceOrientationUnknown ||
        orientation == UIDeviceOrientationPortraitUpsideDown ||
        orientation == UIDeviceOrientationLandscapeRight ||
        orientation == UIDeviceOrientationFaceUp ||
        orientation == UIDeviceOrientationFaceDown){
        return;
    }
    
//    switch (interfaceOrientation) {
//        case UIInterfaceOrientationPortrait:{
//            if (self.isFullScreen) {
//                [self toOrientation:UIInterfaceOrientationPortrait];
//
//            }
//        }
//            break;
//        case UIInterfaceOrientationLandscapeLeft:{
//            if (self.isFullScreen == NO) {
//                [self toOrientation:UIInterfaceOrientationLandscapeLeft];
//                self.isFullScreen = YES;
//            } else {
//                [self toOrientation:UIInterfaceOrientationLandscapeLeft];
//            }
//
//        }
//            break;
//        default:
//            break;
//    }
}


- (void)toOrientation:(UIInterfaceOrientation)orientation {
    
    UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    // 判断如果当前方向和要旋转的方向一致,那么不做任何操作
    if (currentOrientation == orientation) { return; }
    
    if (orientation != UIInterfaceOrientationPortrait) {
        /*
         这里对子控件重新布局
         */
    }
    
    [[UIApplication sharedApplication] setStatusBarOrientation:orientation animated:NO];
    // 获取旋转状态条需要的时间:
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
//    self.transform = CGAffineTransformIdentity;
//    self.transform = [self getTransformRotationAngle];
    
    [UIView commitAnimations];
}
@end
