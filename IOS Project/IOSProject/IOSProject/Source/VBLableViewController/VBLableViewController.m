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
#pragma mark Handling Interface

- (IBAction)onSwitchAnimationSwitch:(id)sender {
    [self.rootView changeSwitchStatusName];
}

- (IBAction)onSwitchStepSwitch:(id)sender {
    [self.rootView changeSwitchStatusName];
}

- (IBAction)onClickAnimationButton:(id)sender {
    [self.rootView moveLabelWithAnimation:YES];
}

- (IBAction)onClickStepButton:(id)sender {
    [self.rootView moveLabelWithAnimation:NO];
}

@end
