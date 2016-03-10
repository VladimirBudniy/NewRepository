//
//  VBAccountant.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAccountant.h"

@implementation VBAccountant

@synthesize money = _money;
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Public

- (void)countMoney:(VBCarWasher *)washer {
    if (washer.money != 0) {
//        NSLog(@"I go to count money from washer");
        self.money = [washer giveMoney];
    } else {
//        NSLog(@"Washer doesn't have money");
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
