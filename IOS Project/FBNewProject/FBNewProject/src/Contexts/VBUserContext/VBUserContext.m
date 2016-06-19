//
//  VBUserContext.m
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBUserContext.h"

@implementation VBUserContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kVBRequestUserParameters;
}

#pragma mark -
#pragma mark Public

- (VBDataUser *)fillWithObject:(NSDictionary *)dictionary {
    VBDataUser *user = self.user;
    user.first_name = [dictionary valueForKey:kVBFistNameKey];
    user.last_name = [dictionary valueForKey:kVBLastNameKey];
    user.userGender = [dictionary valueForKey:kVBGenderKey];
    user.urlString = [NSString stringWithFormat:kVBLargeImageURL, user.ID];
    user.friendsCount = [dictionary valueForKeyPath:kVBFriendsCountKeyPathKey];
    
    return user;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    [self setState:kVBModelLoadedState withObject:[self fillWithObject:result]];
}

@end
