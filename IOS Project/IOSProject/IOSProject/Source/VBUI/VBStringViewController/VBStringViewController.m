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

@interface VBStringViewController ()
@property (nonatomic, readonly) VBStringView  *rootView;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

- (void)setStringsModel:(VBArrayStringsModel *)stringsModel {
    if (_stringsModel != stringsModel) {
        _stringsModel = stringsModel;
        [self.rootView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onUpdateCells:(id)sender {
    self.stringsModel = [VBArrayStringsModel new];
}

#pragma mark -
#pragma mark TableView DataSource
     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stringsModel.arrayStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBTableViewCell *cell = [tableView dequeueReusableCellFromNibWithClass:[VBTableViewCell class]];
    cell.cellLabel.text = self.stringsModel[indexPath.row];
    
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    //    if (!cell) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                      reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    //    }

    
    return cell;
}

@end
