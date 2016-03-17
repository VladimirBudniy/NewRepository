//
//  VBObserver.m
//  C project
//
//  Created by Vladimir Budniy on 15.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"

@interface VBObserver ()
@property (nonatomic, retain) NSMutableArray *mutableObservers;

@end

@implementation VBObserver

@dynamic observers;
@dynamic state;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state {
    return nil;
}

- (instancetype)initWithState:(NSUInteger)state money:(NSUInteger)money {
    return nil;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [self.mutableObservers copy];
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
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

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

@end
