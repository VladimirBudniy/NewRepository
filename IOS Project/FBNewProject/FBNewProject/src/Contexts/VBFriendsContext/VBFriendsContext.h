//
//  VBFriendsContext.h
//  IOSProject
//
//  Created by Vladimir Budniy on 08.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@class VBUser;

@interface VBFriendsContext : VBModel

- (instancetype)initWithUserID:(VBUser *)user;

@end
