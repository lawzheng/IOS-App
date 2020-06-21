//
//  AppDelegate.m
//  sample
//
//  Created by LYCK on 2020/5/23.
//  Copyright © 2020 LYCK. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LZVideoViewController.h"
#import "LZRecommendViewController.h"
#import "LZSplashView.h"

@interface AppDelegate ()<UITabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    ViewController *viewController = [[ViewController alloc] init];
//    UIViewController *controller1 = [[UIViewController alloc] init];
//    controller1.view.backgroundColor = [UIColor redColor];
    viewController.tabBarItem.title = @"新闻";
//    controller1.tabBarItem.image = [UIImage imageNamed:@"icon 上午10.24.18/rest.png"];
//    controller1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon 上午10.24.18/rest1.png"];
    LZVideoViewController *controller2 = [[LZVideoViewController alloc] init];
//    controller2.view.backgroundColor = [UIColor yellowColor];
    
    LZRecommendViewController *controller3 = [[LZRecommendViewController alloc] init];
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor lightGrayColor];
    controller4.tabBarItem.title = @"我的";
    
    [tabbarController setViewControllers:@[viewController,controller2,controller3,controller4]];
    
    tabbarController.delegate = self;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];

    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        LZSplashView *splashView = [[LZSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"hh");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// scheme 调用回调 url参数 options来源等
-(BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return YES;
}

// app 调app方法
-(void)viewClick{
    NSURL *urlScheme = [NSURL URLWithString:@"test://"];
    // 判断能不能打开 要在info.plist中添加白名单 LSApplicationQueriesSchemes
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];
    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
        NSLog(@"");
    }];
}

@end
