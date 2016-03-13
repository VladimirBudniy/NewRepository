//
//  VBStateProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 13.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBMoneyProtocol.h"

typedef enum VBState : NSUInteger {
    kVBUndefindeState,
    kVBCleanCarState,
    kVBDirtyCarState,
    kVBBusyEmployeeState,
    kVBFreeEmployeeState
} VBState;

@protocol VBStateProtocol <NSObject>
@property (nonatomic, assign) VBState state;

- (void)changeState:(id)object;

@end
