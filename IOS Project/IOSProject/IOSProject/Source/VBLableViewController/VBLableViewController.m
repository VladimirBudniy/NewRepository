//
//  VBLableViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 20.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLableViewController.h"
#import "VBLabelView.h"

@interface VBLableViewController ()
@property (nonatomic, strong) VBLabelView *rootView;

@end

@implementation VBLableViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnNilMacro(VBLabelView);

#pragma mark -
#pragma mark Button

- (IBAction)onClickAnimationButton:(id)sender {
    [self.rootView moveLabel];
}

- (IBAction)onPressButton:(id)sender {
    [self.rootView changeLabel];
}

#pragma mark -
#pragma mark Private

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
