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
    [self takeMoney:[object giveMoney]];
    
    if (self.delegate) {
        [self.delegate workerDidFinishedWork:self];
    }
}

@end
