//
//  VBCarWasher.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBCarWasher.h"

@implementation VBCarWasher

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initStaffWithClass:(VBCarWasher *)class {
    self = [super init];
    if (self) {
        self.state = kVBFreeEmployeeState;
    }
    
    return self;
}

#pragma mark -
#pragma mark VBStateProtocol

- (void)changeState:(VBCar *)object {
    if (object.money != 0) {
        object.state = kVBDirtyCarState;
    } else {
        object.state = kVBCleanCarState;
    }
}

#pragma mark -
#pragma mark Public

- (void)washCar:(VBCar *)car{
    [self workerDidFinishedWork:car];
}

@end
