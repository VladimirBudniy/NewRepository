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
#pragma mark Public

- (void)performWorkWithObjectIfNeeded:(VBCar *)object {
    if (object.state != kVBCarCleanState) {
        [self performWorkWithObject:object];
    }
}

- (void)performWorkWithObject:(VBCar *)object {
    [super performWorkWithObject:object];
}

- (void)completeWorkWithObject:(VBCar *)object {
    object.state = kVBCarCleanState;
}

@end
