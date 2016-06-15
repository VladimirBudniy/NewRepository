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

static NSString * const kVBLeftButtonName     = @"left_arrow.png";
static NSString * const kVBRightButtonName    = @"home.png";
static NSString * const kVBNavigationItemText = @"Friends";

@interface VBFriendsViewController ()
@property (nonatomic, readonly) VBFriendsArrayView     *rootView;
@property (nonatomic, strong)   VBFriendsContext       *context;

@end

@implementation VBFriendsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendsArrayView);

-(NSString *)barTitle {
    return kVBNavigationItemText;
}

-(void)setUser:(VBUser *)user {
    if (_user != user) {
        _user = user;
        
        if (_user.isCached) {
            self.arrayModel = [VBArrayModel arrayModelWithArray:_user.friends];
        } else {
            self.context = [[VBFriendsContext alloc] initWithUser:_user];
        }
    }
}

- (void)setArrayModel:(VBArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        
        VBFriendsArrayView *rootView = self.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.tableView reloadData];
    }
}

-(void)setContext:(VBFriendsContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        
        VBWeakSelfMacro;
        [_context addHandler:^(VBUser *user) {
            VBStrongSelfAndReturnNilMacro;
            strongSelf.arrayModel = [VBArrayModel arrayModelWithArray:user.friends];
        } forState:kVBModelLoadedState
                      object:self];
        
        [_context load];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.user.isCached) {
        [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showNavigationBar];
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
