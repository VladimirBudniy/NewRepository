//
//  VBUser.m
//  IOSProject
//
//  Created by Vladimir Budniy on 07.06.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBUser.h"

static NSString * const kVBUserCoderKey     = @"user";
static NSString * const kVBFileAdress       = @"tmp.plist";

@interface VBUser ()
@property (nonatomic, readonly)                  NSString        *path;
@property (nonatomic, readonly, getter=isCached) BOOL            cached;
@property (nonatomic, readonly)                  NSArray         *keys;

- (void)save;
- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;

@end

@implementation VBUser

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self removeObserversWithKeys:self.keys];
}

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
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

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
};

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

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.arrayObjects forKey:kVBUserCoderKey];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
//        self.arrayObjects = [aDecoder decodeObjectForKey:kVBUserCoderKey];
    }
    
    return self;
}

@end
