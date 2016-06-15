//
//  VBConstants.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 11.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBConstants_h
#define VBConstants_h

// context keys
static NSString * const kVBPoint                    = @".";
static NSString * const kVBIDKey                    = @"id";
static NSString * const kVBFistNameKey              = @"first_name";
static NSString * const kVBLastNameKey              = @"last_name";
static NSString * const kVBGenderKey                = @"gender";
static NSString * const kVBFriendsKey               = @"friends";
static NSString * const kVBDataKey                  = @"data";
static NSString * const kVBPictureKey               = @"picture";
static NSString * const kVBURLKey                   = @"url";
static NSString * const kVBSummaryKey               = @"summary";
static NSString * const kVBTotal_countKey           = @"total_count";

static NSString * const kVBHTTPGetMethod            = @"GET";
static NSString * const kVBPictureURLPathKey        = @"picture.data.url";
static NSString * const kVBFriendsKeyPathKey        = @"friends.data";

static NSString * const kVBFriendsCountKeyPathKey   = @"friends.summary.total_count";
static NSString * const kVBLargeImageURL            = @"https://graph.facebook.com/%@/picture?type=large";

//user details view constans
static NSString * const kVBGenderLabelText       = @"gender - %@";
static NSString * const kVBFriendCountLabelText  = @"friends count  - %@";

//context pequest parameters
#define kVBRequestUserParameters @{@"fields": @"id,first_name,last_name,gender,friends"}
#define kVBRequestFriendParameters @{@"fields": @"gender,friends"}
#define kVBRequestFriendsParameters @{@"fields": @"friends{id,first_name,last_name,picture}"}

#define kVBFacebookPermissions @[@"public_profile", @"user_friends"]

#endif /* VBConstants_h */
