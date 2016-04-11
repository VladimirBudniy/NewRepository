//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

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
            
            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
            void (^employeeHandler)(void) = [self.handlersDictionary objectForKey:keyNumber];
            if (employeeHandler) {
                employeeHandler();
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(VBEmployeeHandler)employeeHandler ForState:(NSUInteger)state {
    [self removeHandlerForState:state];
    
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary setObject:[[employeeHandler copy] autorelease] forKey:keyNumber];
}

- (void)removeHandlerForState:(NSUInteger)state {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary removeObjectForKey:keyNumber];
}

@end
