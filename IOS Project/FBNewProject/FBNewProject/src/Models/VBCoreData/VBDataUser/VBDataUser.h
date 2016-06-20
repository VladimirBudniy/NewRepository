//
//  VBDataUser.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 16.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "VBManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBDataUser : VBManagedObject
@property (nonatomic, assign, getter=isCached) BOOL     cached;
@property (nonatomic, assign)                  BOOL     wasLogged;
@property (nonatomic, strong)                  NSArray  *friendsArray;

+ (instancetype)findObjectLogged:(BOOL)logged;

- (void)addFriendsArray:(NSArray *)friends;
- (void)removeFriendsArray:(NSArray *)friends;

@end

NS_ASSUME_NONNULL_END

#import "VBDataUser+CoreDataProperties.h"
