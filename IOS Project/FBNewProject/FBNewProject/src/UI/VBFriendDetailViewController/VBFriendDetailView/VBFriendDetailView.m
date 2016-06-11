//
//  VBFriendDetailView.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 10.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendDetailView.h"
#import "VBUser.h"
#import "VBImageView.h"

@implementation VBFriendDetailView

- (void)fillWithUser:(VBUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.fist_name, user.last_name];
    self.userName.text = name;
    self.userGender.text = user.userGender;
    self.userImage.contentMode = UIViewContentModeCenter;
    self.userImage.URL = [NSURL URLWithString:user.urlString];
}

@end