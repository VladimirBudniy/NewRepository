//
//  VBEmployee.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEmployee.h"
#import "VBAccountant.h"
#import "VBCarWasher.h"
#import "VBDirector.h"

@implementation VBEmployee

@synthesize money = _money;
@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithState:(NSUInteger)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.money = 0;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(VBEmployeeState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObservers];
    }
}

#pragma mark -
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kVBEmployeeFreeState:
            return @selector(readyToWork);
            
        case kVBEmployeeBusyState:
            return @selector(performWorkWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)performWorkWithObject:(id)object {
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
    self.state = kVBEmployeeBusyState;
}

- (void)completeWorkWithObject:(VBEmployee *)object {
    object.state = kVBEmployeeFreeState;
}

#pragma mark -
#pragma mark VBObserverProtocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    return payment;
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (void)readyToWork {
    NSLog(@"%@ is ready to Work", [self.object class]);
}

@end
