//
//  VBStringViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringViewController.h"
#import "VBStringView.h"
#import "VBTableViewCell.h"
#import "VBStringModel.h"
#import "VBStateModel.h"
#import "VBSaveArrayModel.h"

#import "VBLableViewController.h"

@interface VBStringViewController ()
@property (nonatomic, readonly) VBStringView  *rootView;

- (void)performChangesWithObject:(id)object;
- (void)addHandlers;
- (void)performLoad;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

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
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self performLoad];
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onUpdateCellsButton:(id)sender {
//    self.arrayModel = [VBSaveArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
}

- (IBAction)onStartEditingSwitch:(id)sender {
    self.rootView.tableView.editing = self.rootView.editingSwitch.on;
}

#pragma mark -
#pragma mark Private

- (void)addHandlers {
    VBArrayModel *arrayModel = self.arrayModel;
    VBWeakSelfMacro;
    [arrayModel addHandler:^(VBStateModel *model){
        VBStrongSelfAndReturnNilMacroWithClass(VBStringViewController);
        [strongSelf performChangesWithObject:model];
        
    }           forState:kVBModelChangeState
                     object:self];
    
    [arrayModel addHandler:^(VBStateModel *model){
        VBStrongSelfAndReturnNilMacroWithClass(VBStringViewController);
        VBStringView *rootView = strongSelf.rootView;
        [rootView removeLoadingViewAnimated:YES];
        [rootView.tableView reloadData];

    }           forState:kVBModelLoadedState
                     object:self];
}

- (void)performChangesWithObject:(VBStateModel *)object {
    UITableView *tableView = self.rootView.tableView;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:object.index inSection:0];
    
    if (object.state == kVBObjectInserteState) {
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)performLoad {
    [self.rootView showLoadingViewWithDefaultTextAnimated:YES];
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
    
    [self.navigationController pushViewController:[VBLableViewController new] animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    
}

//cell's method for adding and removing
- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    VBArrayModel *model = self.arrayModel;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [model removeObjectAtIndex:indexPath.row];
    } else {
        [model insertObject:[VBStringModel new] atIndex:indexPath.row];
    }
}

// cell's method for moving
- (BOOL)            tableView:(UITableView *)tableView
        canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)            tableView:(UITableView *)tableView
           moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
                  toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.arrayModel moveCellAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

#pragma mark -
#pragma mark TableView Delegate Protocol

// cell's method adding UITableViewCellEditingStyle
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

@end
