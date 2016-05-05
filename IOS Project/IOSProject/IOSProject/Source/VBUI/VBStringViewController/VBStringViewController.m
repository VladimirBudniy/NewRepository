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
@property (nonatomic, readonly) VBStringView     *rootView;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

#pragma mark -
#pragma mark TableView DataSource
     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stringsModel.arrayStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VBTableViewCell *cell = [tableView dequeueReusableCellWithBundleClass:[VBTableViewCell class]];
    cell.cellLabel.text = self.stringsModel.arrayStrings[indexPath.row];
    
    return cell;
}

@end
