//
//  VBUser.h
//  IOSProject
//
//  Created by Vladimir Budniy on 07.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBSDKAccessToken;

@interface VBUser : NSObject
@property (nonatomic, copy) NSString    *fist_name;
@property (nonatomic, copy) NSString    *last_name;
@property (nonatomic, copy) NSString    *userID;
@property (nonatomic, copy) NSString    *userEmail;
@property (nonatomic, copy) NSString    *urlString;
@property (nonatomic, copy) NSString    *userGender;

@property (nonatomic, strong) NSArray   *friends;

- (instancetype)initWithUserID:(NSString *)userID;

@end