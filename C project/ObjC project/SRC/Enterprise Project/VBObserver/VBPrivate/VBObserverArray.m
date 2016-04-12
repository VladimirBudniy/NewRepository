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
    NSMutableArray *array = [NSMutableArray array];
    NSArray *object = [[self.objects copy] autorelease];
    for (VBObserverObject *observerObject in object) {
        if (!observerObject.object) {
            [self.objects removeObject:observerObject];
        } else {
            [array addObject:observerObject.handler];
        }
    }
    
    return [[array copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForObject:(id)object {
    [self.objects addObject:[VBObserverObject objectWithObject:object handler:employeeHandler]];
}

- (void)removeHandlerForObject:(id)object {
    NSArray *objects = [[self.objects copy] autorelease];
    for (VBObserverObject *observerObject in objects) {
        if (observerObject.object == object) {
            [self.objects removeObject:observerObject];
        }
    }
}

@end
