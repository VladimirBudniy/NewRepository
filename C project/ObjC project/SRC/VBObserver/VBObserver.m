//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

@interface VBObserver ()
@property (nonatomic, assign) NSHashTable *mutableObservers;

@end

@implementation VBObserver

@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.mutableObservers = nil;
    self.handlersDictionary = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
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

- (NSArray *)observers {
    return [self.mutableObservers allObjects];
}

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
        void (^employeeBlock)(void) = [self.handlersDictionary objectForKey:keyNumber];
        if (employeeBlock) {
            employeeBlock();
        } else {
            [self notifyObservers];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addBlockForState:(VBEmployeeHandler)employeeBlock state:(NSUInteger)state {
    [self removeBlockForState:state];
    
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary setObject:[[employeeBlock copy] autorelease] forKey:keyNumber];
}

- (void)removeBlockForState:(NSUInteger)state {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary removeObjectForKey:keyNumber];
}

- (void)addObserver:(id)observer {
    [self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

- (void)notifyObserversWithSelector:(SEL)selector {
    for (id observer in self.observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (void)notifyObservers {
    SEL selector = [self selectorForState:self.state];
    [self notifyObserversWithSelector:selector];
}

- (BOOL)observedByObject:(id)object {
    return [self.mutableObservers containsObject:object];
}

@end
