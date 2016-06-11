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
static NSString * const kVBIDKey                    = @"id";
static NSString * const kVBFistNameKey              = @"first_name";
static NSString * const kVBLastNameKey              = @"last_name";
static NSString * const kVBLastGenderKey            = @"gender";
static NSString * const kVBHTTPGetMethod            = @"GET";
static NSString * const kVBPictureURLPathKey        = @"picture.data.url";
static NSString * const kVBFriendsKeyPathKey        = @"friends.data";
static NSString * const kVBFriendsCountKeyPathKey   = @"friends.summary.total_count";
static NSString * const kVBLargeImageURL            = @"https://graph.facebook.com/%@/picture?type=large";

//user details view constans
static NSString * const kVBGenderLabelText       = @"gender - %@";
static NSString * const kVBFriendCountLabelText  = @"friends count  - %@";

#endif /* VBConstants_h */
