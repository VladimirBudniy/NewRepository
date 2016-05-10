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

@interface VBStringViewController ()
@property (nonatomic, readonly) VBStringView  *rootView;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

- (void)setArrayModel:(VBArrayModel *)arrayModel{
    if (_arrayModel != arrayModel) {
        _arrayModel = arrayModel;
        [self.rootView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onUpdateCellsButton:(id)sender {
    self.arrayModel = [VBArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
}

- (IBAction)onStartEditingSwitch:(id)sender {
    self.rootView.tableView.editing = !self.rootView.editingSwitch.on;
}

#pragma mark -
#pragma mark TableView DataSource Protocol
     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBTableViewCell *cell = [tableView dequeueReusableCellFromNibWithClass:[VBTableViewCell class]];
    [cell fillWithModel:self.arrayModel[indexPath.row]];
    
    return cell;
}

// cell's method for catches press
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//celll's method for adding and removing
- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else {
        [self.arrayModel insertObject:[VBStringModel new] atIndex:indexPath.row + 1];
        NSIndexPath *objectIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:objectIndexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
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
    if (indexPath.row % 2) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}


@end
