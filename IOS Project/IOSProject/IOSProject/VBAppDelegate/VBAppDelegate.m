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

@interface VBAppDelegate ()

@end

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow createWindowMainBounts];
    self.window = window;
    
    window.rootViewController = [VBStringViewController controllerFromNib];
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
