//
//  VBCar.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"
#import "VBEnterprise.h"
//#import "VBMoneyProtocol.h"
#import "VBObserverProtocol.h"

typedef enum VBCarState : NSUInteger {
    kVBCarUndefindeState,
    kVBCarCleanState,
    kVBCarDirtyState
} VBCarState;

@interface VBCar : VBObserver <VBObserverProtocol>
@property (nonatomic, assign) VBCarState state;
@property (nonatomic, assign) NSUInteger money;

@end
