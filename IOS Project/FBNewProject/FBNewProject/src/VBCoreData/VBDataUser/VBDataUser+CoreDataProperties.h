//
//  VBDataUser+CoreDataProperties.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 16.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VBDataUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface VBDataUser (CoreDataProperties)

@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSString *userGender;
@property (nonatomic, strong) NSString *userEmail;

@property (nonatomic, assign) NSUInteger friendsCount;
@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, assign) BOOL       wasLogged;

@property (nonatomic, readonly, getter=isCached) BOOL  cached;

@property (nonatomic, strong) VBDataUser *friends;

@end

NS_ASSUME_NONNULL_END
