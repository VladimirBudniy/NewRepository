//
//  VBDirector.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDirector.h"

@interface VBDirector ()
@property (nonatomic, assign) NSUInteger sumProfit;

@end

@implementation VBDirector

@synthesize money = _money;
@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Public

- (void)receivedProfit:(VBAccountant *)accountant {
//    NSUInteger profit = self.money;
    if (self.money == 0) {
        self.money = [accountant giveMoney];
        self.sumProfit = self.money;
        NSLog(@"Director earned %lu", self.money);
    } else {
        NSUInteger sumProfit = (self.sumProfit + [accountant giveMoney]);
        self.sumProfit = sumProfit;
        NSLog(@"Director earned %lu", sumProfit);
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
