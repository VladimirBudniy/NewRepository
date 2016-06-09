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

static NSString * const kVBPermissionKey = @"%@?lields=id,name,last_name,location,email"; // check path

@interface VBUserContext ()
@property (nonatomic, strong) FBSDKGraphRequest *request;
@property (nonatomic, copy)   NSString          *userID;
@property (nonatomic, copy)   NSString          *path;

@property (nonatomic, strong) VBUser *user;

- (NSString *)pathWithUserID:(NSString *)userID;

@end

@implementation VBUserContext

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
                //заливаем юзера
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
