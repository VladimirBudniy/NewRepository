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
@property (nonatomic, readonly) VBLabelView *rootView;

@end

@implementation VBLableViewController

#pragma mark -
#pragma mark Accessors

VBRootViewAndReturnIfNilMacro(VBLabelView);

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onSwitchAnimationSwitch:(id)sender {
    [self.rootView changeSwitchStatusName];
}

- (IBAction)onClickAnimationButton:(id)sender {
    [self.rootView moveLabel];
}

@end
