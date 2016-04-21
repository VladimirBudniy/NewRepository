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

- (IBAction)clickAnimationButton:(id)sender;
- (IBAction)pressButton:(id)sender;

@end

@implementation VBLableViewController

#pragma mark -
#pragma mark Accessors

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (VBLabelView *)rootView {
    VBGetRootViewAndReturnNilMacro;
}

#pragma mark -
#pragma mark Button

- (IBAction)clickAnimationButton:(id)sender {
    [self.rootView moveLabel];
}

- (IBAction)pressButton:(id)sender {
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
