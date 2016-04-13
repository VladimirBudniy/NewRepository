//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

@interface VBObserver ()
@property (nonatomic, retain) NSMutableArray *stateObjects;

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
            
            for (VBObserverStateObject *stateObject in self.stateObjects) {
                VBObserverArray *handlersArray = [stateObject observerArray];
                for (VBEmployeeHandler handler in handlersArray.handlers) {
                    handler();
                }
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForState:(NSUInteger)state object:(id)object {
    
    VBObserverStateObject *stateObject = [self.stateObjects firstObject];
    if (!stateObject || stateObject.state != state) {
        stateObject = [VBObserverStateObject objectWithState:state];
    }
    
    VBObserverArray *observerArray = [stateObject observerArray];
    if (!observerArray) {
        observerArray = [VBObserverArray object];
    }
    
    [observerArray addHandler:employeeHandler ForObject:object];
    stateObject.observerArray = observerArray;
    
    [self.stateObjects addObject:stateObject];
}

- (void)removeHandlerForState:(NSUInteger)state {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        if (stateObject.state == state) {
            [self.stateObjects removeObject:stateObject];
        }
    }
}

- (void)removeHandlerForObject:(id)object {
    for (VBObserverStateObject *stateObject in self.stateObjects) {
        VBObserverArray *handlersArray = [stateObject observerArray];
        [handlersArray removeHandlerForObject:object];
    }
}

@end
