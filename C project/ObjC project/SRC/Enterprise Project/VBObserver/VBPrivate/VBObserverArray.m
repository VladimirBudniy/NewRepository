//
//  VBObserverArray.m
//  C project
//
//  Created by Vladimir Budniy on 12.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserverArray.h"
#import "VBObserverObject.h"

@interface VBObserverArray ()
@property (nonatomic, retain) NSMutableArray *objects;

@end
@implementation VBObserverArray

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self.objects removeAllObjects];
    self.objects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.objects = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    
    [self removeHandlersForObject:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    NSArray *object = [[self.objects copy] autorelease];
    for (VBObserverObject *observerObject in object) {
        [array addObject:observerObject.handler];
    }
    
    return [[array copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)handler forObject:(id)object {
    [self.objects addObject:[VBObserverObject objectWithObject:object handler:handler]];
}

- (void)removeHandlersForObject:(id)object {
    NSArray *objects = [[self.objects copy] autorelease];
    for (VBObserverObject *observerObject in objects) {
        if (observerObject.object == object) {
            [self.objects removeObject:observerObject];
        }
    }
}

@end
