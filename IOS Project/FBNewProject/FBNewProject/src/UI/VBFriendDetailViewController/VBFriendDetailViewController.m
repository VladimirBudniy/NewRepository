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

@end

@implementation VBFriendDetailViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendDetailView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

-(void)setUser:(VBUser *)user {
    [super setUser:user];
    
    self.context = [[VBFriendContext alloc] initWithUser:user];
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.user.isCached) {
        VBFriendDetailView *rootView = self.rootView;   ///// dont like it!!!
        [rootView fillWithUser:self.user];
        [rootView removeLoadingViewAnimated:NO];
    }
}

#pragma mark -
#pragma mark Public

- (void)successLoadObject:(VBUser *)object {
    //        [object saveMangedObject];
    VBFriendDetailView *rootView = self.rootView;
    [rootView fillWithUser:object];
    [rootView removeLoadingViewAnimated:NO];
}

@end
