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

static NSString * const kVBFileAdress = @"/tmp.plist";

@interface VBAppDelegate ()
@property (nonatomic, strong) VBArrayModel *model;

@end

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    VBStringViewController *viewController = [VBStringViewController controllerFromNib];
    
    self.model = [VBArrayModel new];
    viewController.arrayModel = self.model;
    
    window.rootViewController = viewController;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.model save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.model save];
}

@end
