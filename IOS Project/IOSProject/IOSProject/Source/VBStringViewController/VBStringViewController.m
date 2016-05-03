//
//  VBStringViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 03.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBStringViewController.h"
#import "VBStringView.h"

static NSString * const kVBCellIdentifier     = @"Cell";
static NSString * const kVBDefaultString      = @"ABCDIFG";

@interface VBStringViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly) VBStringView     *rootView;
@property (nonatomic, retain)   NSMutableArray   *arrayItems;

@end

@implementation VBStringViewController

#pragma mark - 
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBStringView);

#pragma mark -
#pragma mark ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayItems = [NSMutableArray array];
    NSString *string = [NSString string];
    
    for (NSUInteger index = 0; index < kVBDefaultString.length; index++) {
        NSUInteger charIndex = arc4random_uniform((uint32_t)kVBDefaultString.length);
        string = [NSString stringWithFormat:@"%c", [kVBDefaultString characterAtIndex:charIndex]];
        [self.arrayItems addObject:string];
    }
    
    UITableView *tableView = self.rootView.tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kVBCellIdentifier];
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
