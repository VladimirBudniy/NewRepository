//
//  VBStringViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringViewController.h"
#import "VBStringView.h"

static CGFloat    const kVBDefaultTitleHeight = 44;
static NSString * const kVBCellIdentifier     = @"Cell";

@interface VBStringViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly) VBStringView   *rootView;
@property (nonatomic, retain)   NSArray        *arrayItems;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

#pragma mark -
#pragma mark ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayItems = @[@"one", @"two", @"three", @"four", @"five", @"six"];
    
    UITableView *tableView = self.rootView.tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kVBCellIdentifier];
    
    // was added header for table
    CGSize rootViewSize = self.rootView.frame.size;
    UIView *headerView = [[UIView alloc]
                         initWithFrame:CGRectMake(0, 0, rootViewSize.width, kVBDefaultTitleHeight)];
    
    [headerView paintBackgraundByColor:[UIColor cyanColor]];
    tableView.tableHeaderView = headerView;
    
    CGSize titleViewSize = self.rootView.tableView.tableHeaderView.frame.size;
    UILabel *titleLabel = [[UILabel alloc]
                           initWithFrame:CGRectMakeWithStartPointSize(titleViewSize)];
    
    titleLabel.text = @"  The first test table";
    [tableView.tableHeaderView addSubview:titleLabel];
}

#pragma mark -
#pragma mark TableView DataSource
     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVBCellIdentifier
                                                            forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kVBCellIdentifier];
    }

    UILabel *cellTextLabel = cell.textLabel;
    cellTextLabel.text = [self.arrayItems objectAtIndex:indexPath.row];
    cellTextLabel.textColor = [UIColor blueColor];
    [cell.imageView setImage:[UIImage imageNamed:@"image_add.jpg"]];
    
    return cell;
}

@end
