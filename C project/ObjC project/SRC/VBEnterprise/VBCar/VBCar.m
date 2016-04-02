//
//  VBCar.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBCar.h"

static NSUInteger const kVBCarMoneyCount = 100;

@implementation VBCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kVBCarDirtyState;
        self.money = kVBCarMoneyCount;
    }
    
    return self;
}

- (instancetype)initWithState:(NSUInteger)state money:(NSUInteger)money {
    self = [super init];
    if (self) {
        self.state = state;
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
        }
    }
}

#pragma mark -
#pragma mark VBObserverProtocol

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger payment = self.money;
        self.money = 0;
        
        return payment;
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money = money;
    }
}

@end
