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

- (void)notifyDelegateAboutFinishedWork;

@end


@implementation VBEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBFreeEmployeeState;
    }
    
    return self;
}

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

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    self.state = kVBBusyEmployeeState;
    [self takeMoney:[object giveMoney]];
    [self changeState:object];
    
    [self notifyDelegateAboutFinishedWork];
}

- (void)changeState:(VBEmployee *)object {
    if (object.money != 0) {
        object.state = kVBBusyEmployeeState;
    } else {
        object.state = kVBFreeEmployeeState;
    }
}

- (void)notifyDelegateAboutFinishedWork {
    if (self.delegate) {
        [self.delegate workerDidFinishedWork:self];
    }
}

@end
