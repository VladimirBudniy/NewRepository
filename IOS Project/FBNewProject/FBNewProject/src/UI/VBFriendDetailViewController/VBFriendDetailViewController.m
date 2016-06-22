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
#import "VBImagesViewController.h"
#import "VBFriendDetailView.h"
#import "VBFriendContext.h"
#import "VBDataUser.h"

static NSString * const kVBNavigationItemText = @"Friend";

@interface VBFriendDetailViewController ()
@property (nonatomic, readonly) VBFriendDetailView     *rootView;

- (void)showViewWithUserData:(VBDataUser *)user;

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
    [self showViewWithUserData:object];
}

- (void)faildLoadObject:(VBDataUser *)object {
    [self showViewWithUserData:object];
}

#pragma mark -
#pragma mark Private

- (void)showViewWithUserData:(VBDataUser *)user {
    VBFriendDetailView *rootView = self.rootView;
    [rootView fillWithUser:user];
    [rootView removeLoadingViewAnimated:NO];
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickPhotosButton:(id)sender {
    VBImagesViewController * controller = [VBImagesViewController new];
    controller.user = self.user;
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
