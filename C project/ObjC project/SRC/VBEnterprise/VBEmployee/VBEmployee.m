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
#pragma mark VBMoneyProtocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    return payment;
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

#pragma mark -
#pragma mark VBEndWorkProtocol

- (void)workerDidFinishedWork:(id)object {
    [self performWorkWithObject:object];
}

#pragma mark -
#pragma mark Public

- (void)changeState:(id<VBMoneyProtocol>)object {
    if ([object isMemberOfClass:[VBCar class]]) {
        if (object.money == 0) {
            object.state = kVBCleanCarState;
        }
    }
    
    if ([object isMemberOfClass:[VBCarWasher class]]) {
        if (object.money != 0) {
            object.state = kVBBusyEmployeeState;
        } else {
            object.state = kVBFreeEmployeeState;
        }
    }
    
    if ([object isMemberOfClass:[VBAccountant class]]) {
        if (object.money != 0) {
            object.state = kVBBusyEmployeeState;
        } else {
            object.state = kVBFreeEmployeeState;
        }
    }
    
    if ([object isMemberOfClass:[VBDirector class]]) {
        if (object.money != 0) {
            object.state = kVBBusyEmployeeState;
        } else {
            object.state = kVBFreeEmployeeState;
        }
    }
}

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    [self takeMoney:[object giveMoney]];
    [self changeState:object];
    [self.delegate changeState:self];
    
    if (self.delegate) {
        [self.delegate workerDidFinishedWork:self];
    }
}

@end
