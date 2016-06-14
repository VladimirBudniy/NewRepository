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
#import "VBFriendContext.h"
#import "VBUser.h"

static NSString * const kVBNavigationItemText = @"Friend";

@interface VBFriendDetailViewController ()
@property (nonatomic, readonly) VBFriendDetailView     *rootView;
@property (nonatomic, strong)   VBFriendContext        *context;

@end

@implementation VBFriendDetailViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendDetailView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        self.context = [[VBFriendContext alloc] initWithUser:_user];
    }
}

-(void)setContext:(VBFriendContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(VBUser *user) {
            VBStrongSelfAndReturnNilMacroWithClass(VBFriendDetailViewController);
            VBFriendDetailView *rootView = strongSelf.rootView;
            [rootView fillWithUser:user];
            [rootView removeLoadingViewAnimated:NO];
        } forState:kVBModelLoadedState
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
    [self showNavigationBar];
    
    if (self.user.isCached) {
        VBFriendDetailView *rootView = self.rootView;   ///// dont like it!!!
        [rootView fillWithUser:self.user];
        [rootView removeLoadingViewAnimated:NO];
    }
}

@end
