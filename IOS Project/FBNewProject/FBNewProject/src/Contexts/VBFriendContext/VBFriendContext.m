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

- (VBDataUser *)fillWithObject:(NSDictionary *)dictionary {
    VBDataUser *user = self.user;
    user.userGender = [dictionary valueForKey:kVBGenderKey];
    user.urlString = [NSString stringWithFormat:kVBLargeImageURL, user.ID];
    user.friendsCount = [dictionary valueForKeyPath:kVBFriendsCountKeyPathKey];
    
    [user saveManagedObject];
    return user;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    [self setState:kVBModelLoadedState withObject:[self fillWithObject:result]];
}

@end
