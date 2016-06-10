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

static NSString *const kVBLargeImageURL = @"graph.facebook.com/%@/picture?type=large";

@implementation VBFriendDetailView

- (void)fillWithUser:(VBUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.name, user.last_name];
    self.userName.text = name;
    self.userGender.text = user.userGender;
    self.userImage.URL = [NSURL URLWithString:[NSString stringWithFormat:kVBLargeImageURL, user.userID]];
}

@end
