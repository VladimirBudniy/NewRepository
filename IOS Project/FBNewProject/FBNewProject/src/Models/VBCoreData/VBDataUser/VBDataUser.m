//
//  VBDataUser.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 16.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDataUser.h"

static NSString * const kVBWasLoggedKey    = @"wasLogged";
static NSString * const kVBCachedKey       = @"cached";
static NSString * const kVBFriendsKey      = @"friends";
static NSString * const kVBFirstNameKey    = @"first_name";

@implementation VBDataUser

@dynamic wasLogged;
@dynamic friendsArray;
@dynamic imagesArray;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)findLoggedObject {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = YES", kVBWasLoggedKey];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil predicate:predicate prefetchPaths:nil] firstObject];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)friendsArray {
    NSArray *array = self.friends.allObjects;
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:kVBFirstNameKey ascending:YES];
    
    return [array sortedArrayUsingDescriptors:@[sort]];
}

- (NSArray *)imagesArray {
    return self.images.allObjects;
}

- (void)setWasLogged:(BOOL)wasLogged {
    NSNumber *number = [NSNumber numberWithBool:wasLogged];
    
    [self setCustomValue:number forKey:kVBWasLoggedKey];
}

- (BOOL)wasLogged {
    NSNumber *number = [self customValueForKey:kVBWasLoggedKey];
    
    return [number boolValue];
}

#pragma mark -
#pragma mark Public

- (void)addFriendsArray:(NSArray *)friends {
    NSSet *set = [NSSet setWithArray:friends];
    [self addFriends:set];
}

- (void)removeFriendsArray:(NSArray *)friends {
    NSSet *set = [NSSet setWithArray:friends];
    [self removeFriends:set];
}

@end
