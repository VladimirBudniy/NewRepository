//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBWokerProtocol.h"
#import "VBMoneyProtocol.h"
#import "VBEnterprise.h"
#import "VBCar.h"

typedef enum VBEmployeeState : NSUInteger {
    kVBEmployeeUndefinedState,
    kVBEmployeeBusyState,
    kVBEmployeeFreeState
} VBEmployeeState;

@interface VBEmployee : NSObject <VBMoneyProtocol, VBWokerProtocol>;
@property (nonatomic, assign)   id              delegate;
@property (nonatomic, assign)   VBEmployeeState state;

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object;
- (void)completeWorkWithObject:(id)object;

@end



