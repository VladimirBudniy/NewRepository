//
//  VBStringViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringViewController.h"
#import "VBStringView.h"

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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    return cell;
}

@end
