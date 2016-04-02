//
//  VBCar.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBObserver.h"
#import "VBEnterprise.h"
#import "VBMoneyProtocol.h"
#import "VBObserverProtocol.h"

typedef enum VBCarState : NSUInteger {
    kVBCarUndefindeState,
    kVBCarCleanState,
    kVBCarDirtyState
} VBCarState;

@interface VBCar : NSObject <VBMoneyProtocol>
@property (nonatomic, assign) NSUInteger state;

- (instancetype)initWithState:(NSUInteger)state money:(NSUInteger)money;

@end
