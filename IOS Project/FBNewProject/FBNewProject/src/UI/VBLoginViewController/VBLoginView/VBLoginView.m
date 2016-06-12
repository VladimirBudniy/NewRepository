//
//  VBLoginView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 06.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBLoginView.h"
#import "VBUser.h"
#import "VBImageView.h"
#import "VBConstants.h"

@interface VBLoginView ()

- (void)showUserData;

@end

@implementation VBLoginView

#pragma mark -
#pragma mark Public

- (void)fillWithUser:(VBUser *)user {
    [self showUserData];
    
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.first_name, user.last_name];
    self.userName.text = name;
    self.userGender.text = [NSString stringWithFormat:kVBGenderLabelText, user.userGender];
    self.userFriendsCount.text = [NSString stringWithFormat:kVBFriendCountLabelText, user.friendsCount];
    self.userImage.contentMode = UIViewContentModeCenter;
    
    if (user.isCached) {
//        self.userImage.URL = user.;
    }
    
    self.userImage.URL = [NSURL URLWithString:user.urlString];
}

#pragma mark -
#pragma mark Private

- (void)showUserData {
    self.userName.textColor = [UIColor blackColor];
    self.userGender.textColor = [UIColor blackColor];
    self.userFriendsCount.textColor = [UIColor blackColor];
    self.friendsButton.alpha = 1;
    [self.friendsButton roundCornerRadius:5 borderColor:[UIColor blueColor] borderWidth:0.7];
    self.loginButton.alpha = 0;
    self.userRegistered.alpha = 1;
}

@end
