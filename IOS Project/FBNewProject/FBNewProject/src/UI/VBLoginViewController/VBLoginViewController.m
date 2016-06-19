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
#import "VBUser.h"
#import "VBUserContext.h"
#import "VBConstants.h"

//#import "VBDataUser.h"

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

- (void)setUser:(VBUser *)user {
    [super setUser:user];
    
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    
    if (user.isCached) {
        VBLoginView *rootView = self.rootView;
        [rootView fillWithUser:user];
        [rootView removeLoadingViewAnimated:YES];
    } else {
        self.context = [[VBUserContext alloc] initWithUser:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)successLoadObject:(VBUser *)object {
    VBLoginView *rootView = self.rootView;
    [rootView fillWithUser:object];
    [rootView removeLoadingViewAnimated:YES];
     //        [object saveMangedObject];
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickFriendsButton:(id)sender {
    VBFriendsViewController * controller = [VBFriendsViewController new];
    
    VBUser *user = [VBUser user];
    controller.user = user ? user : self.user;
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickLogoutButton:(id)sender {
     self.user.token = nil;
    [self.rootView showLoginView];
}

- (IBAction)onClickLoginButton:(id)sender {
    VBUser *user = [VBUser user];
    if (user && user.token) {
        self.user = user;
    } else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:kVBFacebookPermissions
                     fromViewController:self
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    if (!error && !result.isCancelled) {
                                        
//                                        VBDataUser *user = [VBDataUser managedObject];
//                                        if (user ......) {
//                                            user.wasLogged = YES;
//                                            self.user = user;
//                                        } else {
//                                            self.user = user
//                                        }

                                        VBUser *user = [[VBUser alloc] initWithUserID:result.token.userID];
                                        user.token = result.token;
                                        user.wasLogged = YES;
                                        self.user = user;
                                    }
                                }];
    }
}

@end
