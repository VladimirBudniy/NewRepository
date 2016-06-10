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

- (void)performWithNavigationController;

@end

@implementation VBFriendDetailViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendDetailView);

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
    }
}


#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self performWithNavigationController];
    [self.rootView fillWithUser:self.user];
}

#pragma mark -
#pragma mark Private

- (void)performWithNavigationController {
    UINavigationController *controller = self.navigationController;
    controller.navigationBarHidden = NO;
    self.navigationItem.title = kVBNavigationItemText;
}

@end
