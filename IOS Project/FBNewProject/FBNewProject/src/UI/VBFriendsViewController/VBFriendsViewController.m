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

- (void)changeNavigationBar;

@end

@implementation VBFriendsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendsArrayView);

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        if (_user.isCached) {
            self.arrayModel = [VBArrayModel arrayModelWithArray:_user.friends];
            VBFriendsArrayView *rootView = self.rootView;
            [rootView removeLoadingViewAnimated:YES];
            [rootView.tableView reloadData];
        } else {
            self.context = [[VBFriendsContext alloc] initWithUserID:_user];
        }
    }
}

-(void)setContext:(VBFriendsContext *)context {
    if (_context != context) {
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(VBUser *user) {
            VBStrongSelfAndReturnNilMacroWithClass(VBFriendsViewController);
            strongSelf.arrayModel = [VBArrayModel arrayModelWithArray:user.friends];
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

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.rootView showLoadingViewWithDefaultTextAnimated:YES]; //// need check place for spinner
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self changeNavigationBar];
}

- (void)didReceiveMemoryWarnin {
    [super didReceiveMemoryWarning];
    [self.user save];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.user save];
}

#pragma mark -
#pragma mark Private

- (void)changeNavigationBar {
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
    
    VBFriendDetailViewController * controller = [VBFriendDetailViewController new];
    controller.user = self.arrayModel[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
