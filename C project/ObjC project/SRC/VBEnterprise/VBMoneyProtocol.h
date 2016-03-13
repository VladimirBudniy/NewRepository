//
//  VBMoneyProtocol.h
//  C project
//
//  Created by Vladimir Budniy on 10.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum VBState : NSUInteger {
    kVBUndefindeState,
    kVBCleanCarState,
    kVBDirtyCarState,
    kVBBusyEmployeeState,
    kVBFreeEmployeeState
} VBState;

@protocol VBMoneyProtocol <NSObject>
@property (nonatomic, assign) NSUInteger money;
@property (nonatomic, assign) VBState state;

- (NSUInteger)giveMoney;

@optional
- (void)takeMoney:(NSUInteger)money;

@end
