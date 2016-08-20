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
#import "VBArrayModel.h"
#import "VBUserContext.h"
#import "VBConstants.h"

#import "VBDataUser.h"

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView        *rootView;

- (void)showViewWithUserData:(VBDataUser *)user;

@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

- (void)setUser:(VBDataUser *)user {
    [super setUser:user];
    
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    self.context = [[VBUserContext alloc] initWithUser:user];
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [super hideNavigationBar];
}

#pragma mark -
#pragma mark Public

- (void)successLoadObject:(VBDataUser *)object {
    [self showViewWithUserData:object];
}

- (void)faildLoadObject:(VBDataUser *)object {
    [self showViewWithUserData:object];
}

#pragma mark -
#pragma mark Private

- (void)showViewWithUserData:(VBDataUser *)user {
    VBLoginView *rootView = self.rootView;
    [rootView fillWithUser:user];
    [rootView removeLoadingViewAnimated:YES];
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickFriendsButton:(id)sender {
    VBFriendsViewController * controller = [VBFriendsViewController new];
    controller.user = self.user;
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickLogoutButton:(id)sender {
    self.user.wasLogged = NO;
    [self.rootView showLoginView];
}

- (IBAction)onClickLoginButton:(id)sender {
    VBDataUser *user = [VBDataUser findLoggedObject];
    if (user) {
        self.user = user;
    } else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:kVBFacebookPermissions
                     fromViewController:self
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    if (error) {
                                        NSLog(@"Process error");
                                    } else if (result.isCancelled) {
                                        NSLog(@"Cancelled");
                                    } else {
                                        NSLog(@"Logged in");
                                        FBSDKAccessToken *token = result.token;
                                        VBDataUser *user = [VBDataUser objectWithID:token.userID];
                                        if (user) {
                                            user.wasLogged = YES;
                                            self.user = user;
                                        }
                                    }
                                }];
    }
}

@end
