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

- (void)performWorkWithObject:(VBCar *)object {
    if (object.state != kVBCarCleanState) {
        [super performWorkWithObject:object];
    }
}

- (void)completeWorkWithObject:(VBCar *)object {
    @synchronized(object) {
        object.state = kVBCarCleanState;
    }
}

@end
