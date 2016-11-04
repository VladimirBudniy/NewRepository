//
//  VBAppDelegate.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "IDPActiveRecordKit.h"

#import "VBAppDelegate.h"
#import "VBLoginViewController.h"
//#import "VBDataUser.h"

static NSString * const kVBCoraDataName = @"FBProjectCoreData";

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions]; // FB SDK
    
    [IDPCoreDataManager sharedManagerWithMomName:kVBCoraDataName];   // core data
    
    UIWindow *window = [UIWindow window];
    
//    [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]]
    
    self.window = window;
    
    VBLoginViewController *viewController = [VBLoginViewController new];
//    [self controllerFromNibWithName:NSStringFromClass([self class])]
    
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
