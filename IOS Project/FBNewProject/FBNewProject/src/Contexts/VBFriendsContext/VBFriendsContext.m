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

#define kVBRequestFriendsParameters @{@"fields": @"friends{id,first_name,last_name,picture}"}

static NSString * const kVBFriendsKeyPathKey    = @"friends.data";
static NSString * const kVBHTTPGetMethod        = @"GET";

static NSString * const kVBIDKey                = @"id";
static NSString * const kVBFistNameKey          = @"first_name";
static NSString * const kVBLastNameKey          = @"last_name";
static NSString * const kVBPictureURLPathKey    = @"picture.data.url";


@interface VBFriendsContext ()
@property (nonatomic, strong)  VBUser    *user;

- (NSArray *)performWorkWithObjects:(NSArray *)objects;

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

- (NSArray *)performWorkWithObjects:(NSArray *)objects {
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

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    VBUser *user = self.user;
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:user.userID
                                  parameters:kVBRequestFriendsParameters
                                  HTTPMethod:kVBHTTPGetMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result, NSError *error)
     {
         NSArray *array = [result valueForKeyPath:kVBFriendsKeyPathKey];
         NSArray *friends = [NSArray arrayWithArray:[self performWorkWithObjects:array]];
         user.friends = friends;
         [self setState:kVBModelLoadedState withObject:user];
     }];
}

@end
