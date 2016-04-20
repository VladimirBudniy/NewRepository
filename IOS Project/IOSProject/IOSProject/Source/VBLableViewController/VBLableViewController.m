//
//  VBLableViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 20.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLableViewController.h"

@interface VBLableViewController ()
@property (nonatomic, weak) IBOutlet UILabel *testLabel;

- (IBAction)pressButton:(id)sender;

@end

@implementation VBLableViewController

#pragma mark -
#pragma mark Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark Button

- (IBAction)pressButton:(id)sender {
    self.testLabel.textColor = [UIColor whiteColor];
    self.testLabel.backgroundColor = [UIColor clearColor];
    self.testLabel.text = @"New test label";
    
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
