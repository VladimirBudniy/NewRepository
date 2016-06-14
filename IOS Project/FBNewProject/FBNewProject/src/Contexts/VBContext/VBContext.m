//
//  VBContext.m
//  FBNewProject
//
//  Created by Vladimir Budniy on 12.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VBContext.h"
#import "VBConstants.h"

@interface VBContext ()
@property (nonatomic, strong) FBSDKGraphRequestConnection   *connection;

@end

@implementation VBContext

@dynamic requestParameters;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUser:(VBUser *)user{
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return nil;
}

#pragma mark -
#pragma mark Public

- (VBUser *)fillWithObject:(NSDictionary *)dictionary {
    VBUser *user = self.user;
    
    return user;
}

- (void)performWorkWithResult:(NSDictionary *)result {
    
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:self.user.userID
                                  parameters:self.requestParameters
                                  HTTPMethod:kVBHTTPGetMethod];
    self.connection = [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                            NSDictionary *result, NSError *error)
                       {
                           if (!error) {
                               [self performWorkWithResult:result];
                           }
                       }];
}

- (void)cancel {
    [self.connection cancel];
}

@end
