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

- (IBAction)onClickAnimationButton:(id)sender {
    [self.rootView moveLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *upperView = self.rootView.upperView;  
    CALayer *viewLayer = upperView.layer;
    viewLayer.masksToBounds = YES;
    viewLayer.cornerRadius = 15;
    viewLayer.borderColor = [[UIColor whiteColor] CGColor];
    viewLayer.borderWidth = 1.5;
    
    UIButton *moveLabelButon = self.rootView.moveLabelButon;
    CALayer *buttonLayer = moveLabelButon.layer;
    buttonLayer.masksToBounds = YES;
    buttonLayer.cornerRadius = 15;
    buttonLayer.borderColor = [[UIColor whiteColor] CGColor];
    buttonLayer.borderWidth = 1.5;
    
    UILabel *movingLabel = self.rootView.label;
    [movingLabel changeFormatForLabel:movingLabel
                                 cornerRadius:15
                                  borderColor:[UIColor whiteColor]
                                  borderWidth:1
                                masksToBounds:YES];
    
    UILabel *animationLabel = self.rootView.animationLabel;
    [animationLabel changeFormatForLabel:animationLabel
                                 cornerRadius:15
                                 borderColor:[UIColor whiteColor]
                                 borderWidth:1.5
                               masksToBounds:YES];
    
    UILabel *stepLabel = self.rootView.stepLabel;
    [stepLabel changeFormatForLabel:stepLabel
                                 cornerRadius:15
                                 borderColor:[UIColor whiteColor]
                                 borderWidth:1.5
                               masksToBounds:YES];
    
    
}

@end
