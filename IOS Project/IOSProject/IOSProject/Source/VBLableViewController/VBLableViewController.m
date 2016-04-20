//
//  VBLableViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 20.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLableViewController.h"

@interface VBLableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

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
    _testLabel.textColor = [UIColor whiteColor];
    _testLabel.backgroundColor = [UIColor clearColor];
    _testLabel.text = @"New test label";
    
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
