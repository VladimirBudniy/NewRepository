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

@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [super hideNavigationBar];
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(VBDataUser *)user {
    [super setUser:user];
    
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    self.context = [[VBUserContext alloc] initWithUser:user];
}

#pragma mark -
#pragma mark Public

- (void)successLoadObject:(VBDataUser *)object {
    VBLoginView *rootView = self.rootView;
    [rootView fillWithUser:object];
    object.cached = YES;
    [object saveManagedObject];
    [rootView removeLoadingViewAnimated:YES];
}

- (void)faildLoadObject:(VBDataUser *)object {
    VBLoginView *rootView = self.rootView;
    [rootView fillWithUser:object];
    [rootView removeLoadingViewAnimated:YES];
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickFriendsButton:(id)sender {
    VBFriendsViewController * controller = [VBFriendsViewController new];
    
    VBDataUser *user = [VBDataUser findObjectWithID:self.user.ID];
    controller.user = user ? user : self.user;
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickLogoutButton:(id)sender {
    self.user.wasLogged = NO;
    [self.rootView showLoginView];
}

- (IBAction)onClickLoginButton:(id)sender {
    VBDataUser *user = [VBDataUser findObjectLogged:YES];
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
