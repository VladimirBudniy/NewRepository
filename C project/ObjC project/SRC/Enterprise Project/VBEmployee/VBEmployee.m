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

@interface VBEmployee ()
- (void)completeWorkWithObject:(id)object;
- (void)completeWork;
- (void)workWithObject:(id)object;
- (void)performWorkWithObjectInBackground:(id<VBMoneyProtocol>)object;

@end

@implementation VBEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (NSArray *)objectsWithCount:(NSUInteger)count observer:(id)observer {
    NSArray *array = [self objectsWithCount:count];
    for (VBEmployee *employee in array) {
        [employee addObserver:observer];
    }
    
    return [[array copy] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBEmployeeFreeState;
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [self init];
    if (self) {
        self.state = state;
        self.money = 0;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kVBEmployeeFreeState:
            return @selector(employeeBecameFree:);
            
        case kVBEmployeeBusyState:
            return @selector(employeeBecameBusy:);
            
        case kVBEmployeeStandbyState:
            return @selector(employeeBecameStandby:);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    if (object) {
        self.state = kVBEmployeeBusyState;
        [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                               withObject:object];
    }
}

#pragma mark -
#pragma mark Private

- (void)performWorkWithObjectInBackground:(id<VBMoneyProtocol>)object {
    @synchronized(self) {
        usleep(arc4random_uniform(100) + 100);
        [self workWithObject:object];
//        NSLog(@"%@ take money %lu", self, self.money);
        [self performSelectorOnMainThread:@selector(completeWork) withObject:nil waitUntilDone:0];
    }
}

- (void)workWithObject:(id)object {
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
}

- (void)completeWorkWithObject:(VBEmployee *)employee {
    employee.state = kVBEmployeeFreeState;
}

- (void)completeWork {
    self.state = kVBEmployeeStandbyState;
}

#pragma mark -
#pragma mark VBMoneyProtocol

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger payment = self.money;
        self.money = 0;
        
        return payment;
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money += money;
    }
}

@end
