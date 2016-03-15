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

- (void)notifyFinishedWork;

@end


@implementation VBEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBEmployeeFreeState;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    self.state = kVBEmployeeBusyState;
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
    
    [self notifyFinishedWork];
}

- (void)completeWorkWithObject:(VBEmployee *)object {
    object.state = kVBEmployeeFreeState;
}

#pragma mark -
#pragma mark Private

- (void)notifyFinishedWork {
    if (self.delegate) {
        [self.delegate workerDidFinishedWork:self];
    }
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
#pragma mark VBWokerProtocol

- (void)workerDidFinishedWork:(id)object {
    [self performWorkWithObject:object];
}

@end
