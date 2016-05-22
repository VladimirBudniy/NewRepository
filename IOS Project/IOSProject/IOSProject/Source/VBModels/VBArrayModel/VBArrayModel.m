//
//  VBArrayModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBArrayModel.h"
#import "VBStringModel.h"
#import "VBDispatch.h"

static NSString * const kVBArrayCoderKey    = @"array";
static NSString * const kVBFileAdress       = @"tmp.plist";

@interface VBArrayModel ()
@property (nonatomic, strong) NSMutableArray *arrayObjects;
@property (nonatomic, copy)   NSString       *path;

@property (nonatomic, readonly, getter=isCached) BOOL cached;

@end

@implementation VBArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)arrayModelWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

+ (instancetype)arrayModelWithArray:(NSArray *)objects {
    return [[self alloc] initWithArray:objects];
}

+ (instancetype)model {
    VBArrayModel *model = [VBArrayModel new];
    if (model.isCached) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:model.path];
    } else {
        return [VBArrayModel arrayModelWithArray:[VBStringModel randomStringsModels]];
    }
}


#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.arrayObjects = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithObject:(id)object {
    self = [self init];
    if (self) {
        [self.arrayObjects addObject:object];
    }
    
    return self;
}

- (instancetype)initWithArray:(NSArray *)objects {
    self = [self init];
    if (self) {
        [self.arrayObjects addObjectsFromArray:objects];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

- (NSString *)path {
    NSString *path = [NSFileManager pathFileWithName:kVBFileAdress];
    self.path = path;
    return path;
}

- (NSArray *)objects {
    return [self.arrayObjects copy];
}

#pragma mark - 
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

- (void)load {
    if (self.state == kVBArrayModelLoadingState) {
        return;
    } else {
        self.state = kVBArrayModelLoadingState;
    }
    
    VBWeakSelfMacro;
    VBDispatchAsyncInBackground(^{
        sleep(3);
        VBStrongSelfAndReturnNilMacroWithClass(VBArrayModel)
        
        VBArrayModel *model = [VBArrayModel model];        
        strongSelf.arrayObjects = model.arrayObjects;
        
        VBDispatchAsyncOnMainThread(^{
            strongSelf.state = kVBArrayModelLoadedState;
            
        });
    });
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.arrayObjects indexOfObject:object];
}

- (NSUInteger)count {
    return self.arrayObjects.count;
}

- (id)objectAtIndex:(NSUInteger)index {
    return self.arrayObjects[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.arrayObjects objectAtIndex:index];
}

- (void)addObject:(id)object {
    [self.arrayObjects addObject:object];
    VBStateModel *model = [VBStateModel modelWithState:kVBObjectInserteState index:self.count];
    [self setState:kVBArrayModelChangeState withObject:model];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    NSUInteger insertIndex = index + 1;
    [self.arrayObjects insertObject:object atIndex:insertIndex];
    VBStateModel *model = [VBStateModel modelWithState:kVBObjectInserteState index:insertIndex];
    [self setState:kVBArrayModelChangeState withObject:model];
}

- (void)removeObject:(id)object {
    [self.arrayObjects removeObject:object];
    VBStateModel *model = [VBStateModel modelWithState:kVBObjectRemoveState
                                                 index:[self indexOfObject:object]];
    [self setState:kVBArrayModelChangeState withObject:model];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.arrayObjects removeObjectAtIndex:index];
    VBStateModel *model = [VBStateModel modelWithState:kVBObjectRemoveState index:index];
    [self setState:kVBArrayModelChangeState withObject:model];
}

- (void)removeAllObjects {
    NSUInteger count = self.count;
    for (NSUInteger index = 0; index < count; index++) {
        VBStateModel *model = [VBStateModel modelWithState:kVBObjectRemoveState index:index];
        [self setState:kVBArrayModelChangeState withObject:model];
    }
    
    [self.arrayObjects removeAllObjects];
}

- (void)moveCellAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.arrayObjects exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
}

#pragma mark -
#pragma mark NSFastEnumeration Protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id*)buffer
                                    count:(NSUInteger)len
{
    return [self.arrayObjects countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.arrayObjects = [aDecoder decodeObjectForKey:kVBArrayCoderKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.arrayObjects forKey:kVBArrayCoderKey];
}

@end
