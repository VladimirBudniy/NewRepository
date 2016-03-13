//
//  VBEmployee.h
//  C project
//
//  Created by Vladimir Budniy on 09.03.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBEndWorkProtocol.h"
#import "VBStateProtocol.h"
#import "VBMoneyProtocol.h"
#import "VBEnterprise.h"
#import "VBCar.h"

@interface VBEmployee : NSObject <VBMoneyProtocol, VBEndWorkProtocol, VBStateProtocol>;
@property (nonatomic, assign) id delegate;

- (instancetype)initStaffWithClass:(Class)class;

- (void)performWorkWithObject:(id<VBMoneyProtocol>)object;

@end



