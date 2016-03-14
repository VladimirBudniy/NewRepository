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

- (void)changeState:(VBCar *)object {
    if (object.money != 0) {
        object.state = kVBDirtyState;
    } else {
        object.state = kVBCleanState;
    }
}

@end
