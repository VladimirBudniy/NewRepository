//
//  VBCar.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBEnterprise.h"
#import "VBMoneyProtocol.h"

//typedef enum VBCarState : NSUInteger {
//    kVBUndefindeCarState,
//    kVBCleanState,
//    kVBDirtyState
//} VBCarState;

@interface VBCar : NSObject <VBMoneyProtocol>
//@property (nonatomic, assign) VBCarState state;

@end
