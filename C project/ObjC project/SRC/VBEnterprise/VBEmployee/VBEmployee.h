//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBEndWorkProtocol.h"
#import "VBMoneyProtocol.h"
#import "VBEnterprise.h"
#import "VBCar.h"

//typedef enum VBEmployeeState : NSUInteger {
//    kVBUndefindeEmployeeState,
//    kVBBusyEmployeeState,
//    kVBFreeEmployeeState
//} VBEmployeeState;

@interface VBEmployee : NSObject <VBMoneyProtocol, VBEndWorkProtocol>;
@property (nonatomic, assign) id              delegate;
//@property (nonatomic, assign) VBEmployeeState state;

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object;
- (void)changeState:(id<VBMoneyProtocol>)object;

@end



