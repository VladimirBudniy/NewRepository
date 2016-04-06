//
//  VBAccountant.m
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBAccountant.h"
#import "VBQueue.h"

@implementation VBAccountant

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(VBEmployee *)object {
    if (self.state == kVBEmployeeFreeState) {
        [super performWorkWithObject:object];
    } else {
        [self.queue pushObject:object];
    }
}

#pragma mark -
#pragma mark Private

- (void)completeWork {
    VBEmployee *washer = [self.queue popObject];
    if (washer) {
        [super performWorkWithObject:washer];
    } else {
        self.state = kVBEmployeeStandbyState;
    }
}

@end
