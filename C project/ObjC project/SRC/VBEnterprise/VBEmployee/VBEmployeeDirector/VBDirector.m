//
//  VBDirector.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDirector.h"

@implementation VBDirector

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initStaffWithClass:(VBDirector *)class {
    self = [super init];
    if (self) {
        self.state = kVBFreeEmployeeState;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    [self takeMoney:[object giveMoney]];
    [self changeState:object];
    
    self.state = kVBFreeEmployeeState;
    [self sayHowMuchEarnedProfit];
}

- (void)sayHowMuchEarnedProfit {
    NSLog(@"Director's money %lu", self.money);
}

#pragma mark -
#pragma mark VBStateProtocol

- (void)changeState:(VBAccountant *)object {
    if (object.money != 0) {
        object.state = kVBBusyEmployeeState;
    } else {
        object.state = kVBFreeEmployeeState;
    }
}

@end
