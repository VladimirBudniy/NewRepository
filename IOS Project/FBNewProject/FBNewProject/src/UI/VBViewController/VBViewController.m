//
//  VBViewController.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 13.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"
#import "VBConstants.h"

@interface VBViewController ()

- (void)leftButtonClick;
- (void)rightButtonClick;

- (void)leftButtonWithImageName:(NSString *)name;
- (void)rightButtonWithImageName:(NSString *)name;

@end

@implementation VBViewController

@dynamic barTitle;

#pragma mark -
#pragma mark Accessors

- (NSString *)barTitle {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)navigationBarHidden:(BOOL)hidden leftButton:(NSString *)leftName rightButton:(NSString *)rightName {
    self.navigationController.navigationBarHidden = hidden;
    self.navigationItem.title = self.barTitle;
    
    [self nameLeftButton:leftName rightButton:rightName];
}

#pragma mark -
#pragma mark Private

- (void)nameLeftButton:(NSString *)leftName rightButton:(NSString *)rightName {
    [self leftButtonWithImageName:leftName];
    [self rightButtonWithImageName:rightName];
}

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
    
}

@end
