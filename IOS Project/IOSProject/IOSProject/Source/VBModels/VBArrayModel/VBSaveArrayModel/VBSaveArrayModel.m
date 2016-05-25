//
//  VBSaveArrayModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 22.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBSaveArrayModel.h"
#import "VBArrayModel.h"
#import "VBStringModel.h"

static NSString * const kVBFileAdress       = @"tmp.plist";

@interface VBSaveArrayModel ()
@property (nonatomic, readonly)                  NSString        *path;
@property (nonatomic, readonly, getter=isCached) BOOL            cached;

@property (nonatomic, strong) NSArray *keys;

+ (instancetype)model;

- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithName:(NSString *)name;

@end

@implementation VBSaveArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    VBSaveArrayModel *model = [VBSaveArrayModel new];
    if (model.isCached) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:model.path];
    } else {
        return [VBSaveArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
    }
}

#pragma mark -
#pragma mark Initializations and Deallocatins

-(void)dealloc {
    [self removeObserversWithName:UIApplicationDidEnterBackgroundNotification];
    [self removeObserversWithName:UIApplicationWillTerminateNotification];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserversWithKeys:self.keys];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)keys {
    NSArray *array = @[UIApplicationDidEnterBackgroundNotification,
                                        UIApplicationWillTerminateNotification];
    self.keys = array;
    
    return array;
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

- (void)removeObserversWithName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:name
                                                  object:nil];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark Public

- (void)finishedLoad {
    self.state = kVBModelLoadedState;
}

- (void)prepareToLoad {
    VBSaveArrayModel *model = [VBSaveArrayModel model];
    [self addObjects:model.objects];
}

@end
