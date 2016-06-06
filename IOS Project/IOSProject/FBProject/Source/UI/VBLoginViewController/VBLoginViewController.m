//
//  VBLoginViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 05.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "VBLoginViewController.h"
#import "VBFriendsViewController.h"
#import "VBLoginView.h"

@interface VBLoginViewController () <FBSDKLoginButtonDelegate>
@property (nonatomic, readonly) VBLoginView *rootView;
@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

//#pragma mark -
//#pragma mark Handling Interface
//
//-(void)loginButtonClicked {
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    [login
//     logInWithReadPermissions: @[@"public_profile"]
//     fromViewController:self
//     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//         if (error) {
//             NSLog(@"Process error");
//         } else if (result.isCancelled) {
//             NSLog(@"Cancelled");
//         } else {
//             NSLog(@"Logged in");
//         }
//     }];
//}

#pragma mark -
#pragma mark FBSDKLoginButton protocol

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error
{
    [self.navigationController pushViewController:[VBFriendsViewController new] animated:YES];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
