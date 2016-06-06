//
//  VBLoginViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "VBLoginViewController.h"
#import "VBLoginView.h"

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView *rootView;
@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

#pragma mark -
#pragma mark Handling Interface



@end
