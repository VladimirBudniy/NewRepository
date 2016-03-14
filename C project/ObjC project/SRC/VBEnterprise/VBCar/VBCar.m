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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBDirtyState;
        self.money = 100;
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
    self.money = money;
}

@end
