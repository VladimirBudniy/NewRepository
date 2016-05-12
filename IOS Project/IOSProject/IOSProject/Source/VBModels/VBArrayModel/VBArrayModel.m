//
//  VBArrayModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 09.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBArrayModel.h"

@interface VBArrayModel ()
@property (nonatomic, strong) NSMutableArray *arrayObjects;

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

- (NSArray *)objects {
    return [self.arrayObjects copy];
}

#pragma mark - 
#pragma mark Public

- (NSUInteger)indexForObject:(id)object {
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
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    NSUInteger insertIndex = index + 1;
    [self.arrayObjects insertObject:object atIndex:insertIndex];
    VBStateModel *model = [VBStateModel new];
    model.state = kVBObjectInserteState;
    model.index = insertIndex;
    [self setState:kVBChangeObjectState withObject:model];
}

- (void)removeObject:(id)object {

    [self.arrayObjects removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.arrayObjects removeObjectAtIndex:index];
    VBStateModel *model = [VBStateModel new];
    model.state = kVBObjectRemoveState;
    model.index = index;
    [self setState:kVBChangeObjectState withObject:model];
}

- (void)removeAllObjects {
    [self.arrayObjects removeAllObjects];
}

- (void)moveCellAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.arrayObjects exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
}

@end
