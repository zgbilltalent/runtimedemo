//
//  AppDelegate.m
//  runtimedemo
//
//  Created by 张盖 on 2017/11/16.
//  Copyright © 2017年 张盖. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIStoryboard *ub = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc =    [ub instantiateViewControllerWithIdentifier:@"ViewController"];
    ViewController * rootViewController= vc;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:rootViewController];
    self.window.rootViewController = nav ;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
