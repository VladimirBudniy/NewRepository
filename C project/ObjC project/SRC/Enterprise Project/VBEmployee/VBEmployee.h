//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBMoneyProtocol.h"
#import "VBObserver.h"
#import "VBEnterprise.h"
#import "VBCar.h"
#import "VBQueue.h"

typedef enum VBEmployeeState : NSUInteger {
    kVBEmployeeUndefinedState,
    kVBEmployeeFreeState,
    kVBEmployeeBusyState,
    kVBEmployeeStandbyState
} VBEmployeeState;

@interface VBEmployee : VBObserver <VBObserverProtocol, VBMoneyProtocol>;
@property (nonatomic, retain) VBQueue *queue;

- (void)performWorkWithObject:(id)object;

@end



