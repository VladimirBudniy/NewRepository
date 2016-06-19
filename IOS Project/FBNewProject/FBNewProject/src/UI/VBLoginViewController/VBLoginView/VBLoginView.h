//
//  VBLoginView.h
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBViewModel.h"
#import "VBLoadingView.h"

@class VBDataUser;
@class VBImageView;

@interface VBLoginView : VBViewModel
@property (nonatomic, strong) IBOutlet UIButton  *loginButton;
@property (nonatomic, strong) IBOutlet UIButton  *friendsButton;
@property (nonatomic, strong) IBOutlet UIButton  *logoutButton;

@property (nonatomic, strong) IBOutlet VBImageView *userImage;
@property (nonatomic, strong) IBOutlet UIImageView *loginImage;
@property (nonatomic, strong) IBOutlet UILabel     *userName;
@property (nonatomic, strong) IBOutlet UILabel     *userGender;
@property (nonatomic, strong) IBOutlet UILabel     *userFriendsCount;

- (void)fillWithUser:(VBDataUser *)user;
- (void)showLoginView;

@end
