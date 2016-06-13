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

static NSString * const kVBLeftButtonName     = @"left_arrow.png";
static NSString * const kVBRighttButtonName   = @"logout.png";
static NSString * const kVBNavigationItemText = @"User profile";

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView        *rootView;
@property (nonatomic, strong)   VBUser             *user;
@property (nonatomic, strong)   VBUserContext      *context;
@property (nonatomic, strong)   FBSDKLoginManager  *login;

@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self navigationBarHidden:YES leftButton:nil rightButton:nil];
    self.navigationItem.leftBarButtonItem = 0;
}

#pragma mark -
#pragma mark Accessors

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

- (void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
        [self navigationBarHidden:NO leftButton:nil rightButton:kVBRighttButtonName];
        
        if (_user.isCached) {
            [self.rootView fillWithUser:_user];
            [self.rootView removeLoadingViewAnimated:YES];
        } else {
           self.context = [[VBUserContext alloc] initWithUser:_user];
        }
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

- (IBAction)onClickFriendsButton:(id)sender {
    VBFriendsViewController * controller = [VBFriendsViewController new];
    
    VBUser *user = [VBUser user];
    if (user) {
        controller.user = user;
    } else {
        controller.user = self.user;
    }

    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickLoginButton:(id)sender {
    VBUser *user = [VBUser user];
    if (user) {
        self.user = user;
    } else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        self.login = login;
        [login logInWithReadPermissions:kVBFacebookPermissions
                     fromViewController:self
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    if (error) {
                                        NSLog(@"Process error");
                                    } else if (result.isCancelled) {
                                        NSLog(@"isCancelled");
                                    } else {
                                        VBUser *user = [[VBUser alloc] initWithUserID:result.token.userID];
                                        user.wasLogged = YES;
                                        self.user = user;
                                    }
                                }];
    }
}

#pragma mark -
#pragma mark Private

- (void)rightButtonClick {
    [self.login logOut];
}

@end
