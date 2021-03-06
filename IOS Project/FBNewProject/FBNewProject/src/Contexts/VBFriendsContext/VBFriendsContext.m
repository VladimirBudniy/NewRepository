//
//  VBFriendsContext.m
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBFriendsContext.h"
#import "VBDataUser.h"

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
    for (NSDictionary *dictionary in object) {
        NSString *IDKey = [dictionary valueForKey:kVBIDKey];
        VBDataUser *friend = [VBDataUser objectWithID:IDKey];
        friend.first_name = [dictionary valueForKey:kVBFistNameKey];
        friend.last_name = [dictionary valueForKey:kVBLastNameKey];
        friend.urlString = [dictionary valueForKeyPath:kVBPictureURLPathKey];
        
        [array addObject:friend];
    }
    
    return array;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    VBDataUser *user = self.user;
    NSArray *array = [result valueForKeyPath:kVBFriendsKeyPath];
    NSArray *friends = [NSArray arrayWithArray:[self fillWithObject:array]];
    [user addFriendsArray:friends];
    [user saveManagedObject];
    [self setState:kVBModelLoadedState withObject:user];
}

@end
