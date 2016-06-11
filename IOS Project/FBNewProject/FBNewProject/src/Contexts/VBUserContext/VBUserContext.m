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

#define kVBRequestUserParameters @{@"fields": @"id,first_name,last_name"}

static NSString *const  kVBLargeImageURL = @"https://graph.facebook.com/%@/picture?type=large";

static NSString * const kVBIDKey             = @"id";
static NSString * const kVBFistNameKey       = @"first_name";
static NSString * const kVBLastNameKey       = @"last_name";
static NSString * const kVBHTTPGetMethod     = @"GET";


@interface VBUserContext ()
@property (nonatomic, strong)  VBUser  *user;

- (VBUser *)performWorkWithObjects:(NSDictionary *)dictionary;

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

- (VBUser *)performWorkWithObjects:(NSDictionary *)dictionary {
    VBUser *user = self.user;
    user.fist_name = [dictionary valueForKey:kVBFistNameKey];
    user.last_name = [dictionary valueForKey:kVBLastNameKey];
    user.urlString = [NSString stringWithFormat:kVBLargeImageURL, user.userID];
    
    return user;
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
         [self setState:kVBModelLoadedState withObject:[self performWorkWithObjects:result]];
     }];
}

@end
