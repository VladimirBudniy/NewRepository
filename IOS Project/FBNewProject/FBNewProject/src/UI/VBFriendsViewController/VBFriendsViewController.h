//
//  VBFriendsViewController.h
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewController.h"

@class VBArrayModel;
@class VBUser;

@interface VBFriendsViewController : VBViewController
@property (nonatomic, strong) VBUser         *user;
@property (nonatomic, strong) VBArrayModel   *arrayModel;

@end
