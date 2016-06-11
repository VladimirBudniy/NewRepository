//
//  VBFriendDetailViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBFriendDetailViewController.h"
#import "VBFriendDetailView.h"
#import "VBUserContext.h"
#import "VBUser.h"

static NSString * const kVBNavigationItemText = @"Friend";

@interface VBFriendDetailViewController ()
@property (nonatomic, readonly) VBFriendDetailView     *rootView;
@property (nonatomic, strong)   VBUserContext          *context;

- (void)changeNavigationBar;

@end

@implementation VBFriendDetailViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendDetailView);

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        self.context = [[VBUserContext alloc] initWithUserID:_user];
    }
}

- (void)setContext:(VBUserContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(VBUser *user) {
            VBStrongSelfAndReturnNilMacroWithClass(VBFriendDetailViewController);
            VBFriendDetailView *rootView = strongSelf.rootView;
            [rootView fillWithUser:user];
            [rootView removeLoadingViewAnimated:YES];
        }forState:kVBModelLoadedState
                      object:self];

        [_context load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self changeNavigationBar];
}

#pragma mark -
#pragma mark Private

- (void)changeNavigationBar {
    UINavigationController *controller = self.navigationController;
    controller.navigationBarHidden = NO;
    self.navigationItem.title = kVBNavigationItemText;
}

@end
