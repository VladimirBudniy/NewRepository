//
//  VBCar.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBCar.h"

@implementation VBCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithState:(NSUInteger)state money:(NSUInteger)money {
    self = [super init];
    if (self) {
        self.state = state;
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark VBObserverProtocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    return payment;
}

- (void)takeMoney:(NSUInteger)money {
    self.money = money;
}

@end
