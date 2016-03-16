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
@synthesize state = _state;

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
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kVBCarCleanState:
            return @selector(carWashed);
            
        case kVBCarDirtyState:
            return @selector(carSolied);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(VBCarState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObservers];
    }
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
