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
    VBUser *user = self.user;
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dictionary in object) {
        NSString *IDKey = [dictionary valueForKey:kVBIDKey];
        VBUser *friend = nil;
        if ([user containsFriendWithID:IDKey]) {
            friend = [user friendWithID:IDKey];
        } else {
            friend = [[VBUser alloc] initWithUserID:IDKey];
        }
        friend.first_name = [dictionary valueForKey:kVBFistNameKey];
        friend.last_name = [dictionary valueForKey:kVBLastNameKey];
        friend.urlString = [dictionary valueForKeyPath:kVBPictureURLPathKey];
        
        [array addObject:friend];
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
