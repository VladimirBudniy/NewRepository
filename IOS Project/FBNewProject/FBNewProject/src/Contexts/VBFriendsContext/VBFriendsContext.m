//
//  VBFriendsContext.m
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBFriendsContext.h"
#import "VBUser.h"
#import "VBConstants.h"

#define kVBRequestFriendsParameters @{@"fields": @"friends{id,first_name,last_name,picture}"}

@interface VBFriendsContext ()
@property (nonatomic, strong)  VBUser    *user;

- (NSArray *)fillWithObject:(NSArray *)objects;
- (void)performWorkWithResult:(NSDictionary *)result;

@end

@implementation VBFriendsContext

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUserID:(VBUser *)user {
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (NSArray *)fillWithObject:(NSArray *)objects {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger index = 0; index < objects.count; index++) {
        NSDictionary *dictionary = objects[index];
        VBUser *user = [[VBUser alloc] initWithUserID:[dictionary valueForKey:kVBIDKey]];
        user.fist_name = [dictionary valueForKey:kVBFistNameKey];
        user.last_name = [dictionary valueForKey:kVBLastNameKey];
        user.urlString = [dictionary valueForKeyPath:kVBPictureURLPathKey];
        
        [array addObject:user];
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

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:self.user.userID
                                  parameters:kVBRequestFriendsParameters
                                  HTTPMethod:kVBHTTPGetMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result, NSError *error)
     {
         [self performWorkWithResult:result];
     }];
}

@end
