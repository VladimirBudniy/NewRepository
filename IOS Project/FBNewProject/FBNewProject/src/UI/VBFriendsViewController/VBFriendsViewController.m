//
//  VBFriendsViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBFriendsViewController.h"
#import "VBFriendDetailViewController.h"
#import "VBFriendsArrayView.h"
#import "VBUser.h"
#import "VBFriendsContext.h"
#import "VBArrayMOdel.h"
#import "VBTableViewCell.h"
#import "VBStateModel.h"

static NSString * const kVBBackButtonText     = @"Back to login";
static NSString * const kVBNavigationItemText = @"Friends";

@interface VBFriendsViewController ()
@property (nonatomic, readonly) VBFriendsArrayView     *rootView;
@property (nonatomic, strong)   VBFriendsContext       *context;

- (void)performWithNavigationController;
//- (void)addHandlers;

@end

@implementation VBFriendsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendsArrayView);

- (void)setArrayModel:(VBArrayModel *)arrayModel{
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        
        //[self addHandlers];
    }
}

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
        self.context = [[VBFriendsContext alloc] initWithUserID:_user.userID];
    }
}

-(void)setContext:(VBFriendsContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(NSArray *friends) {
            VBStrongSelfAndReturnNilMacroWithClass(VBFriendsViewController);
            strongSelf.arrayModel = [VBArrayModel arrayModelWithArray:friends];
            
            VBFriendsArrayView *rootView = strongSelf.rootView;
            [rootView removeLoadingViewAnimated:YES];
            [rootView.tableView reloadData];
        }forState:kVBModelLoadedState
                      object:self];
        
        [_context load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self performWithNavigationController];
}

#pragma mark -
#pragma mark Private

- (void)performWithNavigationController {
    UINavigationController *controller = self.navigationController;
    controller.navigationBarHidden = NO;
    controller.navigationBar.backItem.title = kVBBackButtonText;
    self.navigationItem.title = kVBNavigationItemText;
}

#pragma mark -
#pragma mark TableView DataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBTableViewCell class]];
    [cell fillWithModel:self.arrayModel[indexPath.row]];
    
    return cell;
}

// cell's method for catches press
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    self.context = [[VBUserContext alloc] initWithUserID:self.arrayModel[indexPath].userID];
    
    [self.navigationController pushViewController:[VBFriendDetailViewController new] animated:YES];
    self.navigationController.navigationBar.hidden = NO;

}

@end
