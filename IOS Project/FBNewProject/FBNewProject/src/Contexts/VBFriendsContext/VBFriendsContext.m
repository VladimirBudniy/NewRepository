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

static NSString * const kVBPermissionKey = @"https://facebook.com/%@?fields=id,name,last_name,location,email,user_friends"; // check path

@interface VBFriendsContext ()
@property (nonatomic, strong) FBSDKGraphRequest *request;
@property (nonatomic, copy)   NSString          *userID;
@property (nonatomic, copy)   NSString          *path;

- (NSString *)pathWithUserID:(NSString *)userID;

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
#pragma mark Accessors

- (void)setRequest:(FBSDKGraphRequest *)request {
    if (_request != request) {
        _request = request;
        [_request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                //  распаковать результат
                //заливаем юзеров в массив юзеров friendsArray
                //меняем состояние на loaded
            }
        }];
    }
}

#pragma mark -
#pragma mark Private

- (NSString *)pathWithUserID:(NSString *)userID {
    return [NSString stringWithFormat:kVBPermissionKey, self.userID];
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    if ([FBSDKAccessToken currentAccessToken]) {
        NSString *path = [self pathWithUserID:self.userID];
        self.request = [[FBSDKGraphRequest alloc] initWithGraphPath:path parameters:nil];
    }
}

@end
