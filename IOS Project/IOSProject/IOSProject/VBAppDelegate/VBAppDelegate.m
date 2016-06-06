//
//  VBAppDelegate.m
//  IOSProject
//
//  Created by Vladimir Budniy on 19.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAppDelegate.h"
#import "VBLableViewController.h"
#import "VBStringViewController.h"
#import "VBArrayModel.h"
#import "VBStringModel.h"
#import "VBSaveArrayModel.h"

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    VBStringViewController *viewController = [VBStringViewController controllerFromNib];
    viewController.arrayModel = [VBSaveArrayModel new];
    
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
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
