//
//  VBFriendContext.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 14.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendContext.h"

@implementation VBFriendContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kVBRequestFriendParameters;
}

#pragma mark -
#pragma mark Public

- (VBUser *)fillWithObject:(NSDictionary *)dictionary {
    VBUser *user = self.user;
    user.userGender = [dictionary valueForKey:kVBLastGenderKey];
    user.urlString = [NSString stringWithFormat:kVBLargeImageURL, user.userID];
    user.friendsCount = [dictionary valueForKeyPath:kVBFriendsCountKeyPathKey];
    
    return user;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    [self setState:kVBModelLoadedState withObject:[self fillWithObject:result]];
}

@end
