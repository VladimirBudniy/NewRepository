//
//  VBUserContext.m
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBUserContext.h"
#import "VBUser.h"
#import "VBConstants.h"

#define kVBRequestUserParameters @{@"fields": @"id,first_name,last_name,gender,friends"}

@interface VBUserContext ()
@property (nonatomic, strong)  VBUser  *user;

- (NSArray *)fillWithObject:(NSDictionary *)objects;
- (void)performWorkWithResult:(NSDictionary *)result;

@end

@implementation VBUserContext

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUserID:(VBUser *)user{
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (VBUser *)fillWithObject:(NSDictionary *)dictionary {
    VBUser *user = self.user;
    user.fist_name = [dictionary valueForKey:kVBFistNameKey];
    user.last_name = [dictionary valueForKey:kVBLastNameKey];
    user.userGender = [dictionary valueForKey:kVBLastGenderKey];
    user.urlString = [NSString stringWithFormat:kVBLargeImageURL, user.userID];
    user.friendsCount = [dictionary valueForKeyPath:kVBFriendsCountKeyPathKey];
    
    return user;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    [self setState:kVBModelLoadedState withObject:[self fillWithObject:result]];
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:self.user.userID
                                  parameters:kVBRequestUserParameters
                                  HTTPMethod:kVBHTTPGetMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result, NSError *error)
     {
         [self performWorkWithResult:result];
     }];
}

@end
