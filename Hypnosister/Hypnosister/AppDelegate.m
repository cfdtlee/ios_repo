//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Eric on 4/29/16.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnsisView.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    CGRect firstFrame = self.window.bounds;
//
//    BNRHypnsisView *firstView = [[BNRHypnsisView alloc] initWithFrame:firstFrame];
//    [firstView setUserInteractionEnabled:YES];
//    firstView.backgroundColor = [UIColor whiteColor];

    
    UIViewController *vc = [[UIViewController alloc]init];

    self.window.rootViewController = vc;
//    [self.window addSubview:firstView];

    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2;
    bigRect.size.height *= 2;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:bigRect];
    [self.window addSubview:scrollView];
    
    BNRHypnsisView *hypnosisView = [[BNRHypnsisView alloc] initWithFrame:bigRect];
    [scrollView addSubview:hypnosisView];
    
//    self.window.rootViewController = firstView;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
