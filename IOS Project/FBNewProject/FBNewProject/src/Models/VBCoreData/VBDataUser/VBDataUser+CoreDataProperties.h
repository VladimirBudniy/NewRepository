//
//  VBDataUser+CoreDataProperties.h
//  FBNewProject
//
//  Created by Vladimir Budniy on 19.06.16.
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
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *userGender;

@property (nonatomic, strong) NSNumber           *friendsCount;
@property (nonatomic, strong) NSSet<VBDataUser*> *friends;

@end

@interface VBDataUser (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(VBDataUser *)value;
- (void)removeFriendsObject:(VBDataUser *)value;
- (void)addFriends:(NSSet<VBDataUser *> *)values;
- (void)removeFriends:(NSSet<VBDataUser *> *)values;

@end

NS_ASSUME_NONNULL_END
