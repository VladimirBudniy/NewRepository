//
//  VBAccountant.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAccountant.h"

@implementation VBAccountant

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initStaffWithClass:(VBAccountant *)class {
    self = [super init];
    if (self) {
        self.state = kVBFreeEmployeeState;
    }
    
    return self;
}

#pragma mark -
#pragma mark VBStateProtocol

- (void)changeState:(VBCarWasher *)object {
    if (object.money != 0) {
        object.state = kVBBusyEmployeeState;
    } else {
        object.state = kVBFreeEmployeeState;
    }
}

@end
