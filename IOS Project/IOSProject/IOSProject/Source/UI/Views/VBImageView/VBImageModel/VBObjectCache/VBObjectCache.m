//
//  VBObjectCache.m
//  IOSProject
//
//  Created by Vladimir Budniy on 31.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObjectCache.h"

static NSString * const kVBCacheAdress  = @"cache.plist";
static NSString * const kVBCacheKey    = @"cache";

@interface VBObjectCache ()
@property (nonatomic, readonly)   NSString              *path;
@property (nonatomic, readonly)   NSArray               *saveKeys;
@property (nonatomic, strong)     NSMutableDictionary   *dictionary;

- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;
- (void)save;

@end

@implementation VBObjectCache

@dynamic saveKeys;
@dynamic path;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self removeObserversWithKeys:self.keys];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dictionary = [NSMutableDictionary dictionary];
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
    return [NSFileManager pathFileWithName:kVBCacheAdress];
}

#pragma mark - 
#pragma mark Public

- (void)setObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.dictionary setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.dictionary removeObjectForKey:key];
    }
}

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.dictionary objectForKey:key];
    }
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
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.dictionary = [aDecoder decodeObjectForKey:kVBCacheKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.dictionary forKey:kVBCacheKey];
}

@end
