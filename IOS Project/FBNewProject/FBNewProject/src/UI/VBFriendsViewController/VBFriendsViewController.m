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

#import "VBFriendsView.h"
#import "VBUser.h"
#import "VBUserContext.h"
#import "VBArrayMOdel.h"
#import "VBTableViewCell.h"
#import "VBStateModel.h"

@interface VBFriendsViewController ()
@property (nonatomic, readonly) VBFriendsView  *rootView;
@property (nonatomic, strong)   VBUserContext  *context;

- (void)addHandlers;
- (void)performLoad;

@end

@implementation VBFriendsViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBFriendsView);

- (void)setArrayModel:(VBArrayModel *)arrayModel{
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        
        [self addHandlers];
        [self performLoad];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Friends";
//    self.navigationController.navigationBar.topItem.title = @"Friends"; // имя кнопки назад
//    self.navigationController.navigationBar.topItem.titleView     // вид кнопки назад
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark -
#pragma mark Private

- (void)addHandlers {
    VBArrayModel *arrayModel = self.arrayModel;
    VBWeakSelfMacro;
    [arrayModel addHandler:^(VBStateModel *model){
        VBStrongSelfAndReturnNilMacroWithClass(VBFriendsViewController);
        VBFriendsView *rootView = strongSelf.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.tableView reloadData];
        
    }           forState:kVBModelLoadedState
                    object:self];
}

- (void)performLoad {
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];  // не заходит в метод
    [self.arrayModel load];
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
