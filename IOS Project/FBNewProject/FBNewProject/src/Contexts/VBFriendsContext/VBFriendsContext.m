//
//  VBFriendsContext.m
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendsContext.h"

@implementation VBFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kVBRequestFriendsParameters;
}

#pragma mark -
#pragma mark Public

- (NSArray *)fillWithObject:(NSArray *)object {
    NSMutableArray *array = [NSMutableArray array];
    if (self.user.friends.count != object.count) {
        for (NSDictionary *dictionary in object) {
            VBUser *user = [[VBUser alloc] initWithUserID:[dictionary valueForKey:kVBIDKey]];
            user.first_name = [dictionary valueForKey:kVBFistNameKey];
            user.last_name = [dictionary valueForKey:kVBLastNameKey];
            user.urlString = [dictionary valueForKeyPath:kVBPictureURLPathKey];
            [array addObject:user];
        }
    } else {
        for (VBUser *user in self.user.friends) {
            [array addObject:user];
        }
    }
    
    return array;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    VBUser *user = self.user;
    NSArray *array = [result valueForKeyPath:kVBFriendsKeyPathKey];
    NSArray *friends = [NSArray arrayWithArray:[self fillWithObject:array]];
    user.friends = friends;
    [self setState:kVBModelLoadedState withObject:user];
}

@end
