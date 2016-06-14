//
//  VBViewController.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"
#import "VBConstants.h"

static NSString * const kVBLeftButtonName     = @"left_arrow.png";
static NSString * const kVBRightButtonName    = @"home.png";

@interface VBViewController ()

- (void)leftButtonClick;
- (void)rightButtonClick;

- (void)leftButtonWithImageName:(NSString *)name;
- (void)rightButtonWithImageName:(NSString *)name;

@end

@implementation VBViewController

@dynamic barTitle;
@dynamic leftButtonName;
@dynamic rightButtonName;

#pragma mark -
#pragma mark Accessors

- (NSString *)barTitle {
    return nil;
}

- (NSString *)leftButtonName {
    return kVBLeftButtonName;
}

- (NSString *)rightButtonName {
    return kVBRightButtonName;
}

#pragma mark -
#pragma mark Public

- (void)hideNavigationBar {
    self.navigationController.navigationBarHidden = YES;
}

- (void)showNavigationBar {
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = self.barTitle;
    [self leftButtonWithImageName:self.leftButtonName];
    [self rightButtonWithImageName:self.rightButtonName];
}

#pragma mark -
#pragma mark Private

- (void)leftButtonWithImageName:(NSString *)name {
    UIImage *leftImage = [UIImage imageNamed:name];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftButtonWithImage:leftImage
                                                                          action:@selector(leftButtonClick)
                                                                          target:self];
}

- (void)rightButtonWithImageName:(NSString *)name {
    UIImage *rightImage = [UIImage imageNamed:name];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem leftButtonWithImage:rightImage
                                                                           action:@selector(rightButtonClick)
                                                                           target:self];
}

- (void)leftButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
