//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"
#import "VBObserverWorkObject.h"

@implementation VBObserver

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.handlersDictionary = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlersDictionary = [NSMutableDictionary dictionary];

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
            
            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:_state];
            VBObserverArray *observerArray = [self.handlersDictionary objectForKey:keyNumber];
            
            for (VBEmployeeHandler handler in observerArray.handlers) {
                handler();
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForState:(NSUInteger)state object:(id)object {
    
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    VBObserverArray *observerArray = [self.handlersDictionary objectForKey:keyNumber];
    if (!observerArray) {
        observerArray = [VBObserverArray object];
    }
    
    [observerArray addHandler:employeeHandler ForObject:object];
    [self.handlersDictionary setObject:observerArray forKey:keyNumber];
}

- (void)removeHandlerForState:(NSUInteger)state object:(id)object {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    VBObserverArray *observerArray = [self.handlersDictionary objectForKey:keyNumber];
    [observerArray removeHandlerForObject:object];
}

- (void)removeHandlerForObject:(id)object {
    
}

@end
