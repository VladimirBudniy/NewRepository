//
//  VBFriendsViewController.m
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendsViewController.h"

@interface VBFriendsViewController ()

@end

@implementation VBFriendsViewController


#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Friends";                             // текст на контроллере
//    self.navigationController.navigationBar.topItem.title = @"Friends"; // имя кнопки назад
    //    self.navigationController.navigationBar.topItem.titleView     // вид кнопки назад
    self.navigationController.navigationBarHidden = NO;
}

@end
