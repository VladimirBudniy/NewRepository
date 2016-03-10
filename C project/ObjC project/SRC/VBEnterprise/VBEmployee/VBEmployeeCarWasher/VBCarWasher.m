//
//  VBCarWasher.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBCarWasher.h"

@implementation VBCarWasher

@synthesize money = _money;
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car {
    if (car.state == kVBDirtyState) {
//        NSLog(@"Need to wash car");
        self.money = [car giveMoney];
    } else {
//        NSLog(@"Car is clean, wash is not necessary");
    }
}

#pragma mark -
#pragma mark VBMoneyProtocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    return payment;
}

- (void)takeMoney {
    
}

@end
