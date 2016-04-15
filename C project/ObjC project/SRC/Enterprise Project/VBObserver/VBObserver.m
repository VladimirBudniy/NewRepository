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
- (void)performHandlers;

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
            
            [self performHandlers];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)handler forState:(NSUInteger)state object:(id)object {
    if (object) {
        VBObserverStateObject *stateObject = [self objectWithState:state];
        [stateObject addHandler:[[handler copy] autorelease] forObject:object];
    }
}

- (void)removeHandlerForState:(NSUInteger)state {
    VBObserverStateObject *stateObject = [self objectWithState:state];
    [self.stateObjects removeObject:stateObject];
}

- (void)removeHandlerForObject:(id)object {
    if (object) {
        for (VBObserverStateObject *stateObject in self.stateObjects) {
            [stateObject removeHandlerForObject:object];
        }
    }
}

#pragma mark - 
#pragma mark Private

- (VBObserverStateObject *)objectWithState:(NSUInteger)state {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == state) {
            return stateObject;
        }
    }
    
    VBObserverStateObject *staetObject = [VBObserverStateObject objectWithState:state];
    [self.stateObjects addObject:staetObject];
    
    return staetObject;
}

- (void)performHandlers {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == _state) {
            for (VBEmployeeHandler handler in stateObject.handlers) {
                handler();
            }
        }
    }
}

@end
