//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBObserver.h"
#import "VBEnterprise.h"
#import "VBCar.h"

typedef enum VBEmployeeState : NSUInteger {
    kVBEmployeeUndefinedState,
    kVBEmployeeBusyState,
    kVBEmployeeFreeState
} VBEmployeeState;

@interface VBEmployee : VBObserver <VBObserverProtocol>;
@property (nonatomic, assign) VBEmployeeState state;
@property (nonatomic, assign) NSUInteger      money;
@property (nonatomic, assign) id              object;

- (void)performWorkWithObject:(id)object;
- (void)completeWorkWithObject:(id)object;

@end



