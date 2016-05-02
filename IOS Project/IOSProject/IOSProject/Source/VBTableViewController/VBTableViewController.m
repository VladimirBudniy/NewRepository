//
//  VBTableViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 02.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableViewController.h"
#import "VBTableView.h"

@interface VBTableViewController ()
@property (nonatomic, strong) VBTableView *rootView;

@end

@implementation VBTableViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBTableView);

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
