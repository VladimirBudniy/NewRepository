//
//  VBUser.m
//  IOSProject
//
//  Created by Vladimir Budniy on 07.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBUser.h"
static NSString * const kVBUerIDCoderKey                = @"userID";
static NSString * const kVBUerFriendsCoderKey           = @"userFriends";
static NSString * const kVBUserFirst_nameCoderKey       = @"userFirst_name";
static NSString * const kVBUserLast_nameCoderKey        = @"userLast_name";
static NSString * const kVBUserGenderCoderKey           = @"userGender";
static NSString * const kVBUserFriendsCountCoderKey     = @"userFriendsCount";
static NSString * const kVBUserURLCountCoderKey         = @"userURL";
static NSString * const kVBFileAdress                   = @"tmp.plist";

@interface VBUser ()
@property (nonatomic, readonly)                  NSString        *path;
@property (nonatomic, readonly)                  NSArray         *keys;

- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;
- (void)save;

@end

@implementation VBUser

@dynamic cached;
@dynamic path;
@dynamic keys;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)user {
    VBUser *user = [VBUser new];
    if (user.isCached) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:user.path];
    } else {
        return nil;
    }
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self removeObserversWithKeys:self.keys];
}

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
        self.wasLogged = NO;
        [self addObserversWithKeys:self.keys];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)keys {
    return @[UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification];
}

- (NSString *)path {
    return [NSFileManager pathFileWithName:kVBFileAdress];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Private

- (void)addObserversWithKeys:(NSArray *)keys {
    for (NSString *key in self.keys) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:key
                                                   object:nil];
    }
}

- (void)removeObserversWithKeys:(NSArray *)keys {
    for (NSString *key in self.keys) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:key
                                                      object:nil];
    }
}

- (void)save {
    if (self.wasLogged) {
        [NSKeyedArchiver archiveRootObject:self toFile:self.path];
    }
    
    return;
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.userID forKey:kVBUerIDCoderKey];
    [aCoder encodeObject:self.first_name forKey:kVBUserFirst_nameCoderKey];
    [aCoder encodeObject:self.last_name forKey:kVBUserLast_nameCoderKey];
    [aCoder encodeObject:self.userGender forKey:kVBUserGenderCoderKey];
    [aCoder encodeObject:self.friends forKey:kVBUerFriendsCoderKey];
    [aCoder encodeObject:self.friendsCount forKey:kVBUserFriendsCountCoderKey];
    [aCoder encodeObject:self.urlString forKey:kVBUserURLCountCoderKey];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.userID = [aDecoder decodeObjectForKey:kVBUerIDCoderKey];
        self.first_name = [aDecoder decodeObjectForKey:kVBUserFirst_nameCoderKey];
        self.last_name = [aDecoder decodeObjectForKey:kVBUserLast_nameCoderKey];
        self.userGender = [aDecoder decodeObjectForKey:kVBUserGenderCoderKey];
        self.friends = [aDecoder decodeObjectForKey:kVBUerFriendsCoderKey];
        self.friendsCount = [aDecoder decodeObjectForKey:kVBUserFriendsCountCoderKey];
        self.urlString = [aDecoder decodeObjectForKey:kVBUserURLCountCoderKey];
    }
    
    return self;
}

@end
