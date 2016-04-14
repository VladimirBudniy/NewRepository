//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"
#import "VBObserverStateObject.h"
#import "VBObserverArray.h"
#import "VBObserverObject.h"

@interface VBObserver ()
@property (nonatomic, retain) NSMutableArray *stateObjects;

- (VBObserverStateObject *)objectWithState:(NSUInteger)state;
- (void)performWithHandler;

@end

@implementation VBObserver

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    [self.stateObjects removeAllObjects];
    self.stateObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = 0;
        self.stateObjects = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [self init];
    if (self) {
        self.state = state;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
            
            [self performWithHandler];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)handler forState:(NSUInteger)state object:(id)object {
    if (object) {
        VBObserverStateObject *stateObject = [self objectWithState:state];
        [stateObject.observerArray addHandler:[[handler copy] autorelease] forObject:object];
        [self.stateObjects addObject:stateObject];
    }
}

- (void)removeHandlerForState:(NSUInteger)state {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == state) {
            [self.stateObjects removeObject:stateObject];
        }
    }
}

- (void)removeHandlerForObject:(id)object {
    if (object) {
        for (VBObserverStateObject *stateObject in self.stateObjects) {
            [stateObject.observerArray removeHandlerForObject:object];
        }
    }
}

#pragma mark - 
#pragma mark Private

- (VBObserverStateObject *)objectWithState:(NSUInteger)state {
    for (VBObserverStateObject *object in self.stateObjects) {
        if (object && object.state == state) {
            VBObserverStateObject *sateObject = object;
            [self.stateObjects removeObject:object];
            return sateObject;
        }
    }
    
    return [VBObserverStateObject objectWithState:state];
}

- (void)performWithHandler {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == _state) {
            VBObserverArray *handlersArray = stateObject.observerArray;
            for (VBEmployeeHandler handler in handlersArray.handlers) {
                handler();
            }
        }
    }
}

@end
