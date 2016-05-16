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

@end

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    VBStringViewController *viewController = [VBStringViewController controllerFromNib];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *path = [documentsDirectory stringByAppendingString:kVBFileAdress];
    
    VBArrayModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (model) {
        viewController.arrayModel = model;
    } else {
        viewController.arrayModel = [VBArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
    }

    window.rootViewController = viewController;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *path = [documentsDirectory stringByAppendingString:kVBFileAdress];
    
    VBStringViewController *viewController = (VBStringViewController *)self.window.rootViewController;
    [NSKeyedArchiver archiveRootObject:viewController.arrayModel toFile:path];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
