//
//  VBLoginViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBLoginViewController.h"
#import "VBFriendsViewController.h"
#import "VBLoginView.h"
#import "VBUser.h"
#import "VBFriendsContext.h"
#import "VBArrayModel.h"

#define kVBFacebookPermissions @[@"public_profile", @"user_friends"]

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView    *rootView;
@property (nonatomic, strong)   VBUser         *user;

@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        VBFriendsViewController * controller = [VBFriendsViewController new];
        controller.user = _user;
        controller.arrayModel = [VBArrayModel new];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:kVBFacebookPermissions
                 fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"isCancelled");
                                } else {
                                    self.user = [[VBUser alloc] initWithUserID:result.token.userID];
                                }
                            }];
}

@end
