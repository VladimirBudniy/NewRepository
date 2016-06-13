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

static NSString * const kVBLeftButtonName     = @"left_arrow.png";
static NSString * const kVBRightButtonName    = @"home.png";
static NSString * const kVBNavigationItemText = @"Friend";

@interface VBFriendDetailViewController ()
@property (nonatomic, readonly) VBFriendDetailView     *rootView;

@end

@implementation VBFriendDetailViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendDetailView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self navigationBarHidden:NO leftButton:kVBLeftButtonName rightButton:kVBRightButtonName];
    VBFriendDetailView *rootView = self.rootView;
    [rootView fillWithUser:self.user];
    [rootView removeLoadingViewAnimated:NO];
}

#pragma mark -
#pragma mark Private

- (void)rightButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
