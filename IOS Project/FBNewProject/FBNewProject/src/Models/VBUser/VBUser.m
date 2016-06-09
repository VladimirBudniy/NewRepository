//
//  VBUser.m
//  IOSProject
//
//  Created by Vladimir Budniy on 07.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBUser.h"

@implementation VBUser

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
    }
    
    return self;
}

@end
