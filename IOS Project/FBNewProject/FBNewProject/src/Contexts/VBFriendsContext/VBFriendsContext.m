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
#import "VBArrayModel.h"

#define kVBRequestParameters @{@"fields": @"friends{first_name,last_name,picture,gender,email}"}

static NSString * const kVBIDKey             = @"id";
static NSString * const kVBFistNameKey       = @"first_name";
static NSString * const kVBLastNameKey       = @"last_name";
static NSString * const kVBPictureURLPathKey = @"picture.data.url";

@interface VBFriendsContext ()
@property (nonatomic, copy)    NSString    *userID;
@property (nonatomic, strong)  NSArray     *friends;

- (NSArray *)performWorkWithObjects:(NSArray *)objects;

@end

@implementation VBFriendsContext

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
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
        user.name = [dictionary valueForKey:kVBFistNameKey];
        user.last_name = [dictionary valueForKey:kVBLastNameKey];
        user.urlString = [dictionary valueForKeyPath:kVBPictureURLPathKey];
        
        [array addObject:user];
    }
    
    return array;
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:self.userID
                                  parameters:kVBRequestParameters
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result, NSError *error)
     {
         NSArray *array = [result valueForKeyPath:@"friends.data"];
         NSArray *friends = [NSArray arrayWithArray:[self performWorkWithObjects:array]];
         self.friends = friends;
         [self setState:kVBModelLoadedState withObject:friends];
     }];
}

@end
