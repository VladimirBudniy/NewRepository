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
#import "VBUser.h"
#import "VBLoginContext.h"
#import "VBArrayModel.h"

static NSString * const kVBReadPermissions = @"public_profile";

@interface VBLoginViewController ()
@property (nonatomic, readonly) VBLoginView    *rootView;
@property (nonatomic, strong)   VBLoginContext *context;

@end

@implementation VBLoginViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLoginView);

- (void)setContext:(VBLoginContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(id object){
            VBStrongSelfAndReturnNilMacroWithClass(VBLoginContext)
            
            // нужно хранить следующий по шагу контроллер
            //в его проперти модели переписывать данные полученные от контекста
            
        } forState:kVBModelLoadedState
                    object:self];
        
        [_context load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[kVBReadPermissions]
                 fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                } else {
                                    self.context = [[VBLoginContext alloc] initWithUserID:result.token.userID];
                                    VBFriendsViewController * controller = [VBFriendsViewController new];
                                    controller.arrayModel = [VBArrayModel new];
                                    [self.navigationController pushViewController:controller animated:NO];
                                }
                            }];
}

@end
