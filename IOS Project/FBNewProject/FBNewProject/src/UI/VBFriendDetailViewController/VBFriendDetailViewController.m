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
#import "VBDataUser.h"

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

-(void)setUser:(VBDataUser *)user {
    [super setUser:user];
    
    self.context = [[VBFriendContext alloc] initWithUser:user];
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
}

#pragma mark -
#pragma mark Public

- (void)successLoadObject:(VBDataUser *)object {
    [object saveManagedObject];
    VBFriendDetailView *rootView = self.rootView;
    [rootView fillWithUser:object];
    [rootView removeLoadingViewAnimated:NO];
}

- (void)faildLoadObject:(VBDataUser *)object {
    VBFriendDetailView *rootView = self.rootView;
    [rootView fillWithUser:object];
    [rootView removeLoadingViewAnimated:NO];
}

@end
