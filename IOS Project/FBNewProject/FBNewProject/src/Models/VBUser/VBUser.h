//
//  VBUser.h
//  IOSProject
//
//  Created by Vladimir Budniy on 07.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBSDKAccessToken;

@interface VBUser : NSObject <NSCoding>
@property (nonatomic, copy) NSString    *first_name;
@property (nonatomic, copy) NSString    *last_name;
@property (nonatomic, copy) NSString    *userID;
@property (nonatomic, copy) NSString    *userEmail;
@property (nonatomic, copy) NSString    *urlString;
@property (nonatomic, copy) NSString    *userGender;

@property (nonatomic, strong) NSArray   *friends;
@property (nonatomic, strong) NSNumber  *friendsCount;

@property (nonatomic, assign)                    BOOL wasLogged;
@property (nonatomic, readonly, getter=isCached) BOOL cached;

@property (nonatomic, strong)  FBSDKAccessToken  *token;

+ (instancetype)user;

- (instancetype)initWithUserID:(NSString *)userID;

@end
