//
//  VBDirector.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBDirector.h"

@implementation VBDirector

@synthesize money = _money;

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object {
    [self takeMoney:[object giveMoney]];
    [self sayHowMuchEarnedProfit];
}

- (void)sayHowMuchEarnedProfit {
    NSLog(@"Director's money %lu", self.money);
}

@end
