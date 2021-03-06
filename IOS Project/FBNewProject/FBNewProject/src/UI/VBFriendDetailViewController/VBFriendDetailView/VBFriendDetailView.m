//
//  VBFriendDetailView.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 10.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendDetailView.h"
#import "VBDataUser.h"
#import "VBImageView.h"
#import "VBConstants.h"

@implementation VBFriendDetailView

#pragma mark -
#pragma mark Public

- (void)fillWithUser:(VBDataUser *)user {
    [self.userPhotos roundCornerRadius:5 borderColor:[UIColor blueColor] borderWidth:0.7];
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.first_name, user.last_name];
    self.userName.text = name;
    self.userGender.text = [NSString stringWithFormat:kVBGenderLabelText, user.userGender];
    self.userFriendsCount.text = [NSString stringWithFormat:kVBFriendCountLabelText, user.friendsCount];
    self.userImage.contentMode = UIViewContentModeCenter;
    self.userImage.URL = [NSURL URLWithString:user.urlString];
}

@end
