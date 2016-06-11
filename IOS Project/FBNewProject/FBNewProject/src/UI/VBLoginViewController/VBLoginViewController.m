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


#define kVBFacebookPermissions @[@"public_profile", @"user_friends"]

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView    *rootView;
@property (nonatomic, strong)   VBUser         *user;
@property (nonatomic, strong)   VBUserContext  *context;

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
        
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
        self.context = [[VBUserContext alloc] initWithUserID:_user];
    }
}

- (void)setContext:(VBUserContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(VBUser *user) {
            VBStrongSelfAndReturnNilMacroWithClass(VBLoginViewController);
            VBLoginView *rootView = strongSelf.rootView;
            [rootView fillWithUser:user];
            [rootView removeLoadingViewAnimated:YES];
        }forState:kVBModelLoadedState
                      object:self];
        
        [_context load];
    }
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickVriendsButton:(id)sender {
    VBFriendsViewController * controller = [VBFriendsViewController new];
    controller.user = self.user;
    [self.navigationController pushViewController:controller animated:YES];
}

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
