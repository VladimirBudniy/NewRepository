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

@interface VBStringViewController () <UITableViewDataSource, UITableViewDelegate>
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
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:NSStringFromClass([UITableViewCell class])];
//    }
    
    
    VBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VBTableViewCell class])];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([VBTableViewCell class]) bundle:[NSBundle mainBundle]];
        
        cell = [[nib instantiateWithOwner:self options:nil] firstObject];
    }
    
    cell.cellLabel.text = self.stringsModel.arrayStrings[indexPath.row];
    
    return cell;
}

@end
